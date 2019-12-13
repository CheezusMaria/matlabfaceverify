% Test a new Image
% use code below with giving path to your new image
img = imread('C:\Users\mstfy\Desktop\image_0243.jpg');
[img,face] = cropface(img);
% face value is 1 when it detects face in image or 0
 if face == 1
  img = imresize(img,[227 227]);
  predict=classify(newnet,img)
end
nameofs01 = 'Mustafa';
nameofs02 = 'name of subject 2';
nameofs03 = 'name of subject 3';
nameofs04 = 'name of subject 4';
nameofs05 = 'name of subject 5';
nameofs06 = 'name of subject 6';
nameofs07 = 'name of subject 7';
nameofs08 = 'name of subject 8';
nameofs09 = 'name of subject 9';
nameofs010 = 'name of subject 10';
nameofs011 = 'name of subject 11';
nameofs012 = 'name of subject 12';
nameofs013 = 'name of subject 13';
nameofs014 = 'name of subject 14';
nameofs015 = 'name of subject 15';
nameofs016 = 'name of subject 16';
nameofs017 = 'name of subject 17';
nameofs018 = 'name of subject 18';
nameofs019 = 'name of subject 19';
nameofs020 = 'name of subject 20';
if predict=='s01'
  fprintf('The face detected is %s',nameofs01);
elseif  predict=='s02'
  fprintf('The face detected is %s',nameofs02);
elseif  predict=='s03'
  fprintf('The face detected is %s',nameofs03);
elseif  predict=='s04'
  fprintf('The face detected is %s',nameofs04);
elseif  predict=='s05'
  fprintf('The face detected is %s',nameofs05); 
elseif  predict=='s06'
  fprintf('The face detected is %s',nameofs06);
elseif  predict=='s07'
  fprintf('The face detected is %s',nameofs07);
elseif  predict=='s08'
  fprintf('The face detected is %s',nameofs08);
elseif  predict=='s09'
  fprintf('The face detected is %s',nameofs09);
elseif  predict=='s010'
  fprintf('The face detected is %s',nameofs010);
elseif  predict=='s011'
  fprintf('The face detected is %s',nameofs011);
elseif  predict=='s012'
  fprintf('The face detected is %s',nameofs012);
elseif  predict=='s013'
  fprintf('The face detected is %s',nameofs013); 
elseif  predict=='s014'
  fprintf('The face detected is %s',nameofs014);
elseif  predict=='s015'
  fprintf('The face detected is %s',nameofs015);
elseif  predict=='s016'
  fprintf('The face detected is %s',nameofs016);
elseif  predict=='s017'
  fprintf('The face detected is %s',nameofs017);
elseif  predict=='s018'
  fprintf('The face detected is %s',nameofs018);
elseif  predict=='s019'
  fprintf('The face detected is %s',nameofs019);
elseif  predict=='s020'
  fprintf('The face detected is %s',nameofs020);   
end	 
[predict,score] = classify(newnet,img)