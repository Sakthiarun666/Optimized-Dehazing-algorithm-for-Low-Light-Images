
%{
Using haze removal techniques to enhance low-light images comprises three steps:

Step 1: Invert the low-light image.

Step 2: Apply the haze removal algorithm to the inverted low-light image.

Step 3: Invert the enhanced image. 
%}

%Enhance Low Light Image using Dehazing Algorithm
        
    %Import an RGB image captured in low light.

A = imread('lowlitt.jpeg'); %read Images
figure, imshow(A);
AInv = imcomplement(A); %Invert the image and notice how the low-light areas in the original image appear hazy.
figure, imshow(AInv);
BInv = imreducehaze(AInv); %Reduce the haze using the imreducehaze function.
figure, imshow(BInv);
B = imcomplement(BInv); %Invert the results to obtain the enhanced image.
figure, montage({A, B}); %Display the original image and the enhanced images, side-by-side.

%Improve Results Further Using imreducehaze Optional Parameters
        %To get a better result, call imreducehaze on the inverted image again, this time specifying some optional parameters.
BInv = imreducehaze(AInv, 'Method','approx','ContrastEnhancement','boost');
BImp = imcomplement(BInv);
figure, montage({A, BImp});
