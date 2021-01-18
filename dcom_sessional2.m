% read the image
Image = imread('C:\Users\shubh\Documents\DCOM\samplephoto.jpg');

% calculate the frequency of each pixel
[frequency,pixelValue] = imhist(Image());

% sum all the frequencies
tf = sum(frequency) ;

% calculate the frequency of each pixel
probability = frequency ./ tf ;

% create a dictionary
dict = huffmandict(pixelValue,probability);

% get the image pixels in 1D array
imageOneD = Image(:) ;

% encoding
testVal = imageOneD ;
encodedVal = huffmanenco(testVal,dict);

% decoding
decodedVal = huffmandeco(encodedVal,dict);

% display the length
kb = 8 * 1024 ;
disp(numel(de2bi(testVal))/kb) ;
disp(numel(encodedVal)/kb) ;
disp(numel(de2bi(decodedVal))/kb) ;

% get the original image from 1D Array
[rows, columns, numberOfColorChannels] = size(Image);
oi = reshape(testVal,[rows, columns, numberOfColorChannels]) ;
imwrite(oi,'C:\Users\shubh\Documents\DCOM\original.jpg');

% get the decoded image from 1D Array
decodedVal = uint8(encodedVal);
ci = reshape(decodedVal,[rows, columns, numberOfColorChannels]) ;
imwrite(ci,'C:\Users\shubh\Documents\DCOM\decoded.jpg');