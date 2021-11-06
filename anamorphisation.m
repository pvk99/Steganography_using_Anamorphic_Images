clc;
clear all;
close all;
a=imread('t2.jpg');
a=rgb2gray(a);
a=imresize(a,[256,256]);
alpha=50;
[s1,s2]=size(a);
d=1000;
h=tand(alpha)*d;
 d=1*(s1);
 h=1*(s2);
 d=3*s2;
 h=tand(alpha)*d;
for y=1:s2
	y1(y)=(y/sind(alpha))./(((1-((y/h)*cosd(alpha)))));
    	for t=1:s1
            x1(t,y)=(t*sqrt(((h.^2)+((d+y1(y)).^2))))/sqrt(((h.^2)+(d.^2)+(y.^2)));
    	end
end
 df=zeros(fix(max(x1(:))),fix(max(y1(:))));
 sub_con=1;
 for r1=1:s2
   	 diff=(x1(s1,s2)-(x1(end,sub_con)))/2;
                 	for c1=1:s1
                         re=round(x1(c1,sub_con)+diff);
                         c2=round(y1(1,sub_con));
                         df(re,c2)=a(c1,sub_con);
              	       dfr(r1,c1)=re;
                     	dfr1(r1,c1)=c2;
                 	end
     	sub_con=sub_con+1;
 end
	dfr=df;
 [row,col]=size(df);
 for in_col=1:size(dfr1,1)
 	for all_valu=1:size(x1,1)-1
     	df_x=dfr(in_col,all_valu+1)-dfr(in_col,all_valu);
     	if df_x>1
         	for j=1:df_x-1
             df(dfr(in_col,all_valu)+j,dfr1(in_col,1))=df(dfr(in_col,all_valu+1),dfr1(in_col,1));
         	end
     	end
 	end
 end
 for i=1:size(y1,2)-1
     	in_col=round(y1(1,i));
     	li_col=round(y1(1,i+1));
     	dif_col=li_col-in_col;
     	if dif_col>1
        	[ft_col,lst_col]=find(dfr(i,:));
        	inital_val=dfr(i,1);
        	final_val=dfr(i,end);
         	for all_values=1:dif_col-1
             	for j=inital_val:final_val
                     df(:,in_col+all_values)=df(:,li_col);
              	end
         	end
     	end
 end
 imshow(uint8(df));
 imwrite(df,'anam.bmp');
