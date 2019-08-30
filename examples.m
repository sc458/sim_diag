clear all;
close all;
format short;


%% Example 1
ex = 1;

A1 = 1;
A2 = -2;
A3 = 3;

As = zeros(1,1,3);
As(:,:,1) = A1;
As(:,:,2) = A2;
As(:,:,3) = A3;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);

%% Example 2
ex = 2;

A1 = [2 3; 1 4];
A2 = [1 -6; -2 -3];
A3 = [-1 -3; -1 -3];

As = zeros(2,2,3);
As(:,:,1) = A1;
As(:,:,2) = A2;
As(:,:,3) = A3;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);

%% Example 3
ex = 3;

A1 = [1 0; 0 1];
A2 = [0 1; 1 0];

As = zeros(2,2,2);
As(:,:,1) = A1;
As(:,:,2) = A2;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);

%% Example 4
ex = 4;

A1 = [1 0; 0 1];
A2 = [1 0; 0 -1];

As = zeros(2,2,2);
As(:,:,1) = A1;
As(:,:,2) = A2;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);

%% Example 5
ex = 5;

A1 = [1 0 0; 0 1 0; 1 0 2];
A2 = [2 4 0; 3 1 0; -1 -4 1];

As = zeros(3,3,2);
As(:,:,1) = A1;
As(:,:,2) = A2;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);

%% Example 6
ex = 6;

A1 = [0 1 0; 1 0 0; 0 0 0];
A2 = [1 0 0; 0 1 0; 0 0 -2]/sqrt(3);
A3 = [1 0 0; 0 1 0; 0 0 0];
A4 = [-1i 2 0; 2 -1i 0; 0 0 2*1i];

As = zeros(3,3,4);
As(:,:,1) = A1;
As(:,:,2) = A2;
As(:,:,3) = A3;
As(:,:,4) = A4;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);

%% Example 7
ex = 7;

A1 = [0 1i 0; 1i 0 0; 0 0 0];
A2 = [0 0 1; 0 0 0; 1 0 0];

As = zeros(3,3,2);
As(:,:,1) = A1;
As(:,:,2) = A2;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);

%% Example 8
ex = 8;

A1 = [4 1; 1 0; 0 1];
A2 = [0 0; 1 0; 0 1];

As = zeros(3,2,2);
As(:,:,1) = A1;
As(:,:,2) = A2;

[V,invV,D] = simDiag(As);
outputExample(ex,As,V,invV,D);



