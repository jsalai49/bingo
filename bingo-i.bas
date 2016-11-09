
dim b():randomize:?usg"###"
?:?"Use 0 - Internal data for tickets or
?"    1 - External file 'tick*.txt'":?"    2 - Exit"
input xxx:?
if xxx>1 then stop
if xxx=1
  xxx=files("tick*.txt")
  sort xxx
  for t in xxx
    i++
    ?i;" - ";t
  next
  repeat
    ?:input "Enter No. of file (0-exit): ";j
  until j<=i
  if j=0 then stop
  t=xxx(j-1)
  f0=freefile:open t as #f0
  while not eof(f0)
    linput #f0,t
    split t,",",e use val(x)
    b << e
    y=ubound(b)
    if y=79 then exit loop
  wend
  close #f0
else
  restore 100
  dim e():w=0
  while 1
    read i
    if i=0 or y=79 then exit loop
    e << i
    w++
    if w=15
      b << e
      y=ubound(b)
      erase e,w
    fi
  wend
fi
while 1
  s=3
  dim c(y,1),d(y),rr()
  a=seq(1,90,90)
  n=90
  cls:locate 19,1
  ?cat(3);" [q]uit [w]in [s]tat [n]ums [u]ndo [##] "
  locate 9,13:?" B I N G O ";cat(-3)
  gosub 10
  while n
    if f=0
      p=int(rnd*n)
    else
      p=(f in a)-1
    fi
    n--
    swap a(p),a(n)
    q=a(n)
    locate (q-1)\10,3*((q-1)%10)+3:?usg;q
    locate 9,26:?cat(1);:?usg;(90-n);q;:?cat(-1)
    gosub 30
    gosub 20
    gosub 10
  wend
wend
10
f=91:zzz=0
while f>90
  locate 9,0:?spc(10):locate 9,0:input f
  if f="" then f=0
  x=instr("qwsnu",f)
  if x
    if x=5 then zzz=s
    s=x
    f=91
    gosub 20
  else
    if !isnumber(f) or f<>int(f) or (f in rr) then f=91
  fi
wend
return
20
  locate 10,0
  for i=1 to 8
    ?spc(36)
  next:locate 9,0
  select case s
    case 1
      stop
    case 2
      if y>39 then kk=39 else kk=y
      for i=0 to kk
        if !(i%5) then ?
        if c(i,0)
          ?usg;c(i,0);
          ?"[";c(i,1);"]";
        fi
      next
    case 3
      for i=0 to y
        if !(i%10) then ?
        if d(i)<15
          ?usg;d(i);
        else
          ?" **";
        fi
      next
    case 4
      for i=89 to n step -1
        if !((i-5)%12) then ?
        ?using;a(i);
      next
    case 5
      s=0
      if n<90
        q=a(n)
        locate (q-1)\10,3*((q-1)%10)+3:?"   "
        n++
        if n<90
          q=a(n)
        else
          q=0
        fi
        locate 9,26:?cat(1);:?usg;(90-n);q;:?cat(-1)
      fi
      gosub 30
      if zzz then s=zzz
      gosub 20
  end select
return
30
  dim c(y,1),d(y),rr():w=0
  for x=89 to n step -1
    q=a(x)
    rr << q
    for i=0 to y
      if q in b(i)
        d(i)++
        if d(i)=15
          c(w,0)=i+1
          c(w,1)=90-x
          w++
        fi
      fi
    next
  next
return
100
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
