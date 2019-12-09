# sobel-edge-detector
Sobel is first order or gradient based edge operator for images and it is implemented using verilog.

Sobel performs a 2-D spatial gradient measurement on an image.Sobel is a discrete differentiation operator and it is used to compute an approximate absolute gradient magnitude at each pixel of an image for edge detection. Sobel operator has two masks, one mask finds out horizontal edges and other mask finds out vertical edges. This operator uses a pair of 3×3 kernels which are convolved with the original image
to calculate approximations of the derivatives. Gx is designed to respond to edges running horizontally and Gy is designed to respond to edges running vertically. The direction and the strength of the edge at a particular location in the image can be computed by using the gradients Gx and Gy. These resulting gradient approximations can then be combined together to give absolute gradient magnitude at each point in the image.

Implementation of Sobel Edge Detection Algorithm:
                         Implementation of edge detection using sobel operator, with the help of verilog hardware description language. An image is taken as an input. If this input image is colored, then firstly, this RGB image is converted to grayscale image with the help of MATLAB R2019a. This image is very large, thus it is resized. Then this image is written into a text file and value of every pixel in an image is obtained. Code for sobel edge detection is written in verilog

Conclusion and Future Scope:
                         Sobel edge detection algorithm is chosen because it has less deterioration at high levels of noise. Parallel nature of FPGA reduces processing time and increases speed. Algorithm for sobel edge detection is coded using verilogThis algorithm can be used in various image processing applications such as in medical imaging, video surveillance. It can also be used in lane departure warning system to
detect edges of lanes. Pipelined sobel edge detection algorithm can be used infuture to improve speed. This will be helpful for high speed
applications.
