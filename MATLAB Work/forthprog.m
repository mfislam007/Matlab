f = (x - 3)/abs(x-3);
ezplot(f,[-1,5])
l = limit(f,x,3,'left')
r = limit(f,x,3,'right')