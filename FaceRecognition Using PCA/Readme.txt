Objective: Face Recognition using PCA
The gallery folder  contains images from 40 individuals, each of them providing 5 images. The pixel intensities of the 200 face images will be used for computing the KL Transform. By employing the method of efficient computation of the basis vectors for high dimensional data.
(i) Displaying the Eigenface images corresponding to the top 5 Eigen values of the covariance matrix.

(ii) Ploting a graph depicting the percentage of the total variance of the original data retained in the reduced space versus the number of dimensions. From this graph, 
Finding the number of dimensions required for projecting the face vectors so that at least 95% of the total variance of the original data is accounted for in the reduced space.

(iii) Reconstruct the unseen image ‘face input 1.pgm’ using the:
   	(a) Eigenface corresponding to the largest eigenvalue.
 	(b) Top 15 Eigenfaces
 	(c)  All the Eigenfaces
    Displaying the reconstructed image and the mean squared error in each case.

(iv)Depicting graphically the mean squared error obtained for different number of Eigenfaces. Note that the Eigenfaces may vary from 1 to 200 (total number of training samples).
