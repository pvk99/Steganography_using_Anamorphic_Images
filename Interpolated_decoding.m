input_image = imread('stegoImage.bmp');
% Number of characters of the hidden text
chars = 15;

% Number of bits in the message
message_length = chars * 8;

% counter to keep track of number of bits extracted
counter2 = 1;


for i=1:size(y1,2)-1
        in_col=round(y1(1,i));
        li_col=round(y1(1,i+1));
        dif_col=li_col-in_col;
        if dif_col>1
            [ft_col,lst_col]=find(dfr(i,:));
            inital_val=dfr(i,1);
            final_val=dfr(i,end);
            for all_values=1:dif_col-1
                for j=inital_val:final_val
                    if (counter2 <= message_length)
                        % Store the LSB of the pixel in extracted_bits
                   extracted_bits(counter2, 1) = mod(double(dfk(i,in_col+all_values)), 2);
                        % Increment the counter
                        counter2 = counter2 + 1;
                    end
                end
             end
          end
end
% Powers of 2 to get the ASCII value from binary
% binValues = [ 128 64 32 16 8 4 2 1 ];

% Get all the bits in 8 columned table
% Each row is the bits of the character
% in the hidden text
% binMatrix = reshape(extracted_bits, [],(message_length/16));

% Convert the extracted bits to characters
% by multiplying with powers of 2
% textString = char(binValues*binMatrix);

% Print the hidden text
% disp(textString);

