%% STEP B: DECODING VERSION
	%% STEP 2B: Import "Canvas Image" With Hidden Message.
	[FileName,PathName] = uigetfile('*.bmp','Select "Canvas Image" With Hidden Message.');
	img = imread( strcat(PathName,FileName) );
	
	%% STEP 3B: Prompt User for Encryption Key
	enc_key = input('Please Enter an Encryption Key Between 0 - 255:\n');
	if enc_key < 0 || enc_key > 255
    	error('Invalid Key Selection');
	end
	
	enc_key = uint8(enc_key);
	
	%% STEP 4B: Allow User to Select SEQUENTIAL or RANDOM Decoding Method
	decode = input('Enter 1 for Sequential Decoding, 2 for Random Decoding:\n');
	if decode == 1
    	% SEQUENTIAL DECODING: This only needs an Encryption Key Input.
    	output = stegandecoder(img,enc_key);
	elseif decode == 2
    	% RANDOM DECODING: This needs the Encryption Key AND Random Seed
    	%   Value.
    	
    	% Random Seed Value
    	randSeed = input('Please Enter Random Seed Value Between 1 - 100:\n');
   	 if randSeed < 1 || randSeed > 100
        	error('Invalid Random Seed Value')
    	end
    	randSeed = uint8(randSeed);
    	
    	% Final Output
    	output = stegandecoder_Rand(img,enc_key,randSeed);
	else
    	error('Invalid Encoding Selection');
	end
	
	%% STEP 5B: Writing Message to .TXT or .JPG File
	secfn = input('Enter File Name for Image + Message:\n','s');
	nametest = ischar(secfn);
	if nametest == 1
    	msgtest = ischar(output);
    	if msgtest == 1
        	% TEXT Message CASE
        	fid = fopen(strcat(secfn,'.txt'),'w');
        	fwrite(fid,output,'char');
        	fclose(fid);
    	else
        	% IMAGE Message CASE
        	imwrite(output,strcat(secfn,'.bmp'));
    	end
	else
    	error('Invalid File Name');
    end