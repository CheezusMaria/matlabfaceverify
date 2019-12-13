
faceDetector = vision.CascadeObjectDetector('FrontalFaceCART','MinSize',[227,227]);
n = 100;
str = 'Person1';
pointTracker = vision.PointTracker('MaxBidirectionalError', 2);

cam = webcam();
videoFrame = snapshot(cam);
frameSize = size(videoFrame);

videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);
runLoop = true;
numPts = 0;
frameCount = 0;
i=1;

while runLoop && frameCount < n
    
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame);
    frameCount = frameCount + 1;

    if numPts < 10
      
        bbox = faceDetector.step(videoFrameGray);

        if ~isempty(bbox)
            
            points = detectMinEigenFeatures(videoFrameGray, 'ROI', bbox(1, :));
            xyPoints = points.Location;
            numPts = size(xyPoints,1);
            release(pointTracker);
            initialize(pointTracker, xyPoints, videoFrameGray);
            oldPoints = xyPoints;
            bboxPoints = bbox2points(bbox(1, :));
            bboxPolygon = reshape(bboxPoints', 1, []);
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);
            videoFrame = insertMarker(videoFrame, xyPoints, '+', 'Color', 'white');
        end

    else
        [xyPoints, isFound] = step(pointTracker, videoFrameGray);
        visiblePoints = xyPoints(isFound, :);
        oldInliers = oldPoints(isFound, :);

        numPts = size(visiblePoints, 1);

        if numPts >= 10
            [xform, oldInliers, visiblePoints] = estimateGeometricTransform(...
                oldInliers, visiblePoints, 'similarity', 'MaxDistance', 4);
            
            bboxPoints = transformPointsForward(xform, bboxPoints);

            bboxPolygon = reshape(bboxPoints', 1, []);
            imwrite(videoFrame,[ 'photos\',str,'\',int2str(i), '.jpg']);
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);

            videoFrame = insertMarker(videoFrame, visiblePoints, '+', 'Color', 'white');
            
            oldPoints = visiblePoints;
            setPoints(pointTracker, oldPoints);
            i = i+1;
        end

    end
    step(videoPlayer, videoFrame);
    runLoop = isOpen(videoPlayer);
end

clear cam;
release(videoPlayer);
release(pointTracker);
release(faceDetector);
