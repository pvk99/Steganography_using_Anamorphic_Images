# Steganography using Anamorphic Images
A project that explores the possibility of combining steganography and anamorphisation to achieve heightened security while transmitting images from point to point

Steganography: It is the technique of hiding secret data within an ordinary, non-secret image in order to avoid detection.

Anamorphization: It is that technique that distorts the image using parameters of angle, distance and height to ensure that the original image can be recovered only if all of the three parameters are known. This results in the image increasing in size.

The project achieves Anamorphization of the input image and explores two different types of encoding of the text message in the anamorphized image – Sequential Encoding (Lossless encoding) and Interpolated Encoding (Lossy Encoding). The relative change in the original image and the image extracted at the receiving end is calculated by the MSE between the two. There is loss of information of the image while using Interpolated Encoding whereas the loss is minimal/negligible while using Sequential Encoding.

The encoding is achieved my changing the Least Significant Bit(LSB) of the anamorphized image. The image is decoded at the receiving end and then deanamorphized to retrieve the original image. 

The input images are to be placed in the same folder as the scripts and the outputs are generated at the same location. Each of the individual MATLAB files can be executed to look at their respective results. The individual scripts are to be executed on matlab. 

anamorphization.m  - produces the anamorphized output of a given input image

sequential_encoding.m & sequential_decoding.m - encoder produces the anamorphized image, encodes the text and the decoder reverses the operations to retrieve the message in a lossless manner

interpolated_encoding.m & interpolated_decoding.m - performs encoding and decoding in a lossy manner - modifies bits that have undergone anamorphization unlike lossless encoding that affects all bits of the pixel matrix.

