nr=10:nt=99:bp=90\nr:fv=500:fh=-1:hs=xmax\txtw(" ")
f.color="white":f.backgroundcolor="blue"
a=["Quit","Status","Nums","Wins","Undo","Rnd"]
c=["q","s","n","w","u","r"]:b.width=80:b.x=fh:b.y=fv
for i=0 to 5
  b.label=a(i):b.value=c(i):f.inputs << b
next
b.y=fv+45:b.width=45
for i=0 to 9
  b.x=i*48+4:b.label=i:b.value=i:f.inputs << b
next
b.value="":b.y=fv+90:b.x=145:b.width=200:b.type="image"
b.label="B I N G O":f.inputs << b:b.x=0:b.width=45
b.label="":f.inputs << b:b.x=-1:f.inputs << b
b.width=30:b.backgroundcolor="black":f.inputs << b
k=0:g.color="white":g.backgroundcolor="blue"
b.x=200:b.y=150:b.width=200:b.type="image":b.value=""
b.label="B I N G O":b.nofocus=1:g.inputs << b
aa="Exit|Internal data|External file"
b.value=aa:b.color="white":b.backgroundcolor="black"
b.x=200:b.y=200:b.width=200:b.height=200:b.type="list"
g.inputs << b
dim bb():randomize:?usg"###"
gosub 300:a=seq(1,90,90):n=90:s=3:gosub 30:gosub 20:?
k=0:j=0:f=form(f)
while 1
  f.doEvents()
    t=f.value:f.value=""
    if isnumber(t)
      k++:j=10*j+t:f.inputs(19).label=j:f.refresh()
      if k=2
        k=0
        if (j in rr) or !(j in a)
          j=0
        else
          gosub 10
        fi
      fi
    elif t in "rnqsuw"
      f.inputs(19).label="":f.refresh():k=0:j=0
      select case t
        case "q":stop
        case "r":gosub 10
        case "u":gosub 15
        case "w":s=2:gosub 20
        case "s":s=3:gosub 20
        case "n":s=4:gosub 20
      end select
    fi
wend
10
  if n=0
    locate 0,0:for i=1 to 24:?spc(hs):next
    n=90:s=3:q="":goto 18
  fi
  p=(j in a)-1:p=iff(j=0,int(rnd*n),p):j=0
  n--:swap a(p),a(n):q=a(n)
  locate (q-1)\nr,3*((q-1)%nr):?usg;q:goto 18
15
  if n=90 then return
  q=a(n):locate (q-1)\nr,3*((q-1)%nr):?"   ":n++
  q=iff(n<90,a(n),"")
18
  i=iff(n=90,"",90-n)
  f.inputs(17).label=i:f.inputs(18).label=q:f.refresh()
  gosub 30:gosub 20
return
20
  locate bp+1,0
  for i=9 to 24:?spc(hs):next:locate bp,0
    select case s
    case 2
      if y>nt\2 then kk=nt\2+1 else kk=y
      for i=0 to kk
        if !(i%(nr\2)) then ?
        if c(i,0)=0
          if i=0 then ?"No winners!"
          exit for
        fi
        ?usg;c(i,0);:?"/";c(i,1);
      next
    case 3
      for i=0 to y
        if !(i%nr) then ?
        if d(i)<15 then ?usg;d(i); else ?" **";
      next
    case 4
      for i=89 to n step -1
        if !((89-i)%nr) then ?
        ?usg;a(i);
      next
  end select
return
30
  dim c(y,1),d(y),rr():w=0
  for x=89 to n step -1
    q=a(x)
    rr << q
    for i=0 to y
      if q in bb(i)
        d(i)++
        if d(i)=15
          c(w,0)=i+1:c(w,1)=90-x:w++
        fi
      fi
    next
  next
return
300
 g=form(g)
  while 1
    g.doEvents()
    if len(g.value)>0
      z=g.value
      if z="Exit" then stop
      if k=0
        x=g.inputs(1).selectedindex
        if x=1
          gosub 310:exit loop
        else
          fl=files("*.txt"):sort fl:join fl,"|",aa
          aa="Exit|"+aa:k=1:g.inputs(1).value=aa
          g.inputs(1).selectedindex=0:g.refresh()
        fi
      else
        gosub 310:exit loop
      fi
    fi
  wend
  g.close()
return
310
  if k=1
    f0=freefile:open z as #f0
    while not eof(f0)
      linput #f0,t
      split t,",",e use val(x)
      if ubound(e)=89 then redim e(14)
      bb << e
      y=ubound(bb)
      if y=nt then exit loop
    wend
    close #f0
  else
    restore 1000
    dim e():w=0
    while 1
      read i
      if i=0 or y=nt then exit loop
      e << i
      w++
      if w=15
        bb << e
        y=ubound(bb)
        erase e,w
      fi
    wend
  fi
return
1000
data 20,33,43,60,81,16,23,54,63,74,6,36,58,75,84
data 1,10,42,51,83,17,24,37,46,67,27,57,68,78,86
data 2,11,41,62,80,12,32,55,64,72,8,25,38,49,59
data 13,22,30,52,70,31,44,65,77,85,7,15,26,47,90
data 40,53,61,71,82,4,14,35,45,69,9,19,29,79,88
data 3,21,50,66,73,5,34,48,56,87,18,28,39,76,89
data 41,55,63,71,81,4,12,25,43,85,9,16,36,64,76
data 21,30,40,54,73,13,35,47,67,83,7,18,57,78,88
data 5,11,20,44,62,14,29,38,53,84,8,39,48,77,90
data 10,22,32,70,80,1,26,33,56,65,19,49,59,69,79
data 15,23,34,51,60,45,52,66,75,87,6,27,37,46,89
data 2,31,50,72,82,3,24,42,61,74,17,28,58,68,86
data 3,30,40,54,61,16,25,44,63,89,29,38,58,78,90
data 20,31,60,72,80,7,22,42,53,64,8,14,34,49,86
data 5,11,21,50,67,27,45,55,77,87,18,39,68,79,88
data 10,23,32,41,81,4,35,66,73,83,6,19,46,57,76
data 1,52,62,74,82,15,26,43,65,85,17,28,36,59,75
data 12,33,51,70,84,2,13,24,47,71,9,37,48,56,69
data 12,20,33,40,71,21,48,54,64,83,8,18,38,59,89
data 10,22,30,50,61,4,11,31,43,72,47,53,62,79,86
data 24,51,63,74,80,3,16,44,65,82,9,17,25,37,75
data 23,34,41,60,76,6,14,42,68,85,7,28,58,77,88
data 2,45,52,73,81,5,26,36,69,87,19,29,39,46,56
data 1,13,32,55,70,15,27,35,66,84,49,57,67,78,90
data 7,21,40,63,71,12,38,49,55,73,18,28,59,67,90
data 3,32,41,50,82,13,24,45,54,66,16,36,69,79,85
data 11,31,42,52,70,14,22,35,64,83,6,27,56,78,89
data 4,23,30,51,62,25,44,57,75,86,8,15,68,77,88
data 1,20,33,72,81,17,46,61,74,84,5,19,37,48,53
data 2,10,43,60,80,26,34,65,76,87,9,29,39,47,58
data 0
