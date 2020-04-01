fs = 16000;

load 'rir.mat'
load 'source.mat'

[I,J,Lr] = size(rir);
[~,Ls] = size(source);

Lx = Ls+Lr-1;
x = zeros(I,Lx);
for i = 1:I
    for j = 1:J
        x(i,:) = x(i,:)+conv(source(j,:),squeeze(rir(i,j,:)));
    end
end

y = ctf_mint(x,rir,1e-5,6);

figure;plot(y')
figure;plot(source')

