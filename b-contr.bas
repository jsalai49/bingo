fl=files("*.txt"):sort fl:join fl,"|",aa:aa+="||Exit"
b.value=aa:b.color="white":b.backgroundcolor="black"
b.x=200:b.y=200:b.width=150:b.height=200:b.type="list"
b.nofocus=1:g.inputs << b:color 15,0:g=form(g)
while 1
  g.doEvents()
  z=g.value:if z="Exit" then exit loop
  if z in fl then gosub 2
wend
g.close():cls:stop
2 locate 0,0:for i=1 to 5:?spc(30):next:locate 0,0
dim w():n=0:?:?"File:",z:f1=freefile:open z as #f1
while not eof(f1)
  n++:if n%100=0:locate 2,0:?n:fi:linput #f1,t
  w << t+"-"+n:split t,",",d use val(x):f=ubound(d)
  if !(f in [14,89]):?n,"len:",f+1:stop:fi
  for z in d:if z<1 or z>90:?n,"num:",i,z:stop:fi:next
  if f=14:sort d:fi:gosub 3:if f=89:sort d:for i=1 to f
  if d(i)=d(i-1):?n,"dupl",i,d(i):stop:fi:next:fi
wend
gosub 4:?"Finished":close #f1:return
3 h=f\15:for o=0 to h:x=o*15+1:y=x+13:z=0:for i=x to y
  if d(i)=d(i-1):?n,"dupl",i,d(i):stop:fi
  k=d(i)\10-(d(i)=90):l=d(i-1)\10:z=(z+(k=l))*(k=l)
  if (k=l and z>1) or k>l+1:?n,"dec:",i,d(i):stop:fi
next:next:return
4 sort w:m=ubound(w):for i=1 to m
if leftof(w(i-1),"-")=leftof(w(i),"-"):?w(i)
input "dupl 1-end",x:if x>0:stop:fi:fi:next:return