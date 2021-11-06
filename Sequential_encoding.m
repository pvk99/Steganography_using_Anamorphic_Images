    %% STEP A: ENCODING VERSION
	%% STEP 2A: Select "Canvas Image" and "Message File".
	% First Get "Canvas" Image.
	[FileName,PathName] = uigetfile({'*.jpg';'*.png';'*.gif';'*.bmp'},'Select "Canvas Image" to Hide Message.');
	img = imread( strcat(PathName,FileName) );
	
	% Next get Message File
	msg_type = input('Enter 1 for TEXT Message, 2 for IMAGE Message:\n');
	if msg_type == 1
    	[FileName,PathName] = uigetfile('*.txt','Select TEXT MESSAGE.');
    	testmsg = fopen( strcat(PathName,FileName) );
    	[msg] = fscanf(testmsg,'%c');
	elseif msg_type == 2
    	[FileName,PathName] = uigetfile({'*.jpg';'*.png';'*.gif';'*.bmp'},'Select IMAGE MESSAGE.');
    	msg = imread( strcat(PathName,FileName) );
	else
    	error('Invalid Message Type Selection');
	end
	
    %% STEP 3A: Prompt User for Encryption Key
	enc_key = input('Please Enter an Encryption Key Between 0 - 255:\n');
	if enc_key < 0 || enc_key > 255
    	error('Invalid Key Selection');
	end
	
	enc_key = uint8(enc_key);
	
	%% STEP 4A: Allow User to Select SEQUENTIAL or RANDOM Encoding Method
	encode = input('Enter 1 for Sequential Encoding, 2 for Random Encoding:\n');
	if encode == 1
    	% SEQUENTIAL ENCODING: This only needs an Encryption Key Input.
    	output = stegancoder(img,msg,enc_key);
	elseif encode == 2
    	% RANDOM ENCODING: This needs the Encryption Key AND Random Seed
    	%   Value.
    	
    	% Random Seed Value
    	randSeed = input('Please Enter Random Seed Value Between 1 - 100:\n');
    	if randSeed < 1 || randSeed > 100
        	error('Invalid Random Seed Value')
    	end
    	
    	randSeed = uint8(randSeed);
    	
    	% Final Output
    	output = stegancoder_Rand(img,msg,enc_key,randSeed);
	else
    	error('Invalid Encoding Selection');
	end
	
	%% STEP 5A: Write Canvas Image to .BMP File
	% BMP, or bitmap format, was chosen because it DOES NOT use
	%   compression. JPEG compression destroys the message.
	secfn = input('Enter File Name for Image + Message:\n','s');
	nametest = ischar(secfn);
	if nametest == 1
    	imwrite(output,strcat(secfn,'.bmp'));
	else
    	error('Invalid File Name');
	end
