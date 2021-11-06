% Message to be embedded
message='processingtexts';


% Length of the message where each character is 8 bits
len = length(message) * 8;

% Get all the ASCII values of the characters of the message
ascii_value = uint8(message);

% Convert the decimal values to binary
bin_message = transpose(dec2bin(ascii_value, 8));

% Get all the binary digits in separate row
bin_message = bin_message(:);

% Length of the binary message
N = length(bin_message);

% Converting the char array to numeric array
bin_num_message=str2num(bin_message);

% Counter for number of embedded bits
embed_counter = 1;

dfk=df;
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
                    % If there are more bits remaining to embed
                    if(embed_counter <= len)
                    % Finding Least Significant Bit of the current pixel
                    LSB = mod(double(dfk(i,li_col)), 2);
                    % Find whether the bit is same or needs to change
                    temp = double(xor(LSB, bin_num_message(embed_counter)));
                    % Updating the output to input + temp
                    dfk(i,in_col+all_values) = dfk(i,li_col)+temp;  
                    % Increment the embed counter
                    embed_counter = embed_counter+1;
                    end
                end
            end
        end
end
imshow(uint8(dfk));