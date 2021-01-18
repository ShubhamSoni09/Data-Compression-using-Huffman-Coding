%%encoding and decoding of a paragraph
clear all;
text=char('Digital Communication is a topic which deals with physical transfer of data and it indeed is a very interesting topic! ');
t=double(text); %converting text data into ascii value
N=length(t);
frequency=zeros(1,128);
for k=0:127
count=0;
for i=1:N
if(t(i)==k)
count=count+1;
end
end
frequency(k+1)=count; %counting frequency of each character
end
sym=find(frequency)-1;  % getting information about used character in paragrph
sym_count=frequency(sym+1); % frequency of used symbols
sym_prob=sym_count/N;  %  probability of symbol
%% creating huffman code for symbol
% creating the dictionary corresponding to each used symbol
 [dict,avglen]=huffmandict(sym,sym_prob);
averagelength= avglen;
averagelength
enco=huffmanenco(t,dict) %encoding the data
 b=huffmandeco(enco,dict) %decoding the data
text=char(b)
L= length(text);
P=length(enco);
CompressionRatio= L*7/P