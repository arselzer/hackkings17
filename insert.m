[hight,with, y] = size(p1);
firstHit = zeros(hight,with);
secondHit = zeros(hight,with);
thirdHit = zeros(hight,with);

firstCol = zeros(hight,with,3);
secondCol = zeros(hight,with,3);
thirdCol = zeros(hight,with,3);

% inPic = imread('a.png');
% [x,y]= size(str)
for s = 1: 2
    disp(s)
    if s==1
        inPic = p1;
        diffMat = abs( p1 - firstCol);
    elseif s==2
        inPic = p2;
        diffMat = abs( p2 - firstCol);
    elseif s == 3
        inPic = p3;
        diffMat = abs( p3 - firstCol);
    elseif s == 4
        inPic = p4;
        diffMat = abs( p4 - firstCol);
    elseif s == 5
        inPic = p5;
        diffMat = abs( p5 - firstCol);
    elseif s == 6
        inPic = p6;
        diffMat = abs( p6 - firstCol);
    elseif s == 7
        inPic = p7;
        diffMat = abs( p7 - firstCol);
    end
        
% inPic = imread(str(s));
[hight,with, y] = size(inPic);

diffMat = diffMat > 5 ;
% dilat=[1 1 1;
%     1 1 1;
%     1 1 1];
% diffMat = imdilate(diffMat,dilat);

for h = 1:hight
    disp(h)
    
    
%     disp('h')
%     disp(h)
%     disp('h')
    for w = 1:with
       
%         disp(w)
        
%         if firstHit(h,w) < 1
%             firstHit(h,w) = firstHit(h,w) +1;
%             firstCol(h,w) = inPic(h,w);
%             break;
%         end
%         if secondHit(h,w) < 1
%             secondHit(h,w) = secondHit(h,w) +1;
%             secondCol(h,w) = inPic(h,w);
%             break;
%         end
%         if thirdHit(h,w) < 1
%             thirdHit(h,w) = thirdHit(h,w) +1;
%             thirdCol(h,w) = inPic(h,w);
%             break;
%         end
        
        if diffMat(h,w) == 0
            firstHit(h,w) = firstHit(h,w) +1;
           
        else
       

        pix = inPic(h,w,:) ;
%         disp(pix)
        if pix == firstCol(h,w,:)
            
            disp(s)
            firstHit(h,w) = firstHit(h,w) +1;
            
           
            
        elseif pix == secondCol(h,w,:)
            
            secondHit(h,w) = secondHit(h,w) +1;
            
            
        elseif pix == thirdCol(h,w,:)
            
            thirdHit(h,w) = thirdHit(h,w) +1;
            
        else
            thirdCol(h,w,:) = pix;
            thirdHit(h,w) = 1;
            
        end
        
        if thirdHit(h,w) >= secondHit(h,w)
%             disp('oli')
            tmp = thirdCol(h,w,:);
%             disp(tmp)
            thirdCol(h,w,:) = secondCol(h,w,:);
            secondCol(h,w,:) = tmp;
            amp = thirdHit(h,w);
            thirdHit(h,w) = secondHit(h,w);
            secondHit(h,w) = amp;
        end
        if secondHit(h,w) >= firstHit(h,w)
%              disp('ver');
             
            tmp = secondCol(h,w,:);
            secondCol(h,w,:) = firstCol(h,w,:);
            firstCol(h,w,:) = tmp;
            tmp = firstHit(h,w);
            firstHit(h,w) = secondHit(h,w);
            secondHit(h,w) = tmp;
        end
        end    
            
        
        
            
            
            
        
        
        
        
        
        
    end 
end



end



% for h = 1:hight
%     
%     
% %     disp('h')
% %     disp(h)
% %     disp('h')
%     for w = 1:with
% %         disp(w)
%         
% %         if firstHit(h,w) < 1
% %             firstHit(h,w) = firstHit(h,w) +1;
% %             firstCol(h,w) = inPic(h,w);
% %             break;
% %         end
% %         if secondHit(h,w) < 1
% %             secondHit(h,w) = secondHit(h,w) +1;
% %             secondCol(h,w) = inPic(h,w);
% %             break;
% %         end
% %         if thirdHit(h,w) < 1
% %             thirdHit(h,w) = thirdHit(h,w) +1;
% %             thirdCol(h,w) = inPic(h,w);
% %             break;
% %         end
%         
%         
%        
% 
%         pix = inPic(h,w,:) ;
% %         disp(pix)
%         if pix == firstCol(h,w,:)
%             
%             firstHit(h,w) = firstHit(h,w) +1;
%            
%             
%         elseif pix == secondCol(h,w,:)
%             
%             secondHit(h,w) = secondHit(h,w) +1;
%             
%             
%         elseif pix == thirdCol(h,w,:)
%             
%             thirdHit(h,w) = thirdHit(h,w) +1;
%             
%         else
%             thirdCol(h,w,:) = pix;
%             thirdHit(h,w) = 1;
%             
%         end
%         
%         if thirdHit(h,w) > secondHit(h,w)
%             disp('oli')
%             tmp = thirdCol(h,w,:);
%             disp(tmp)
%             thirdCol(h,w,:) = secondCol(h,w,:);
%             secondCol(h,w,:) = tmp;
%             amp = thirdHit(h,w);
%             thirdHit(h,w) = secondHit(h,w);
%             secondHit(h,w) = amp;
%         end
%         if secondHit(h,w) > firstHit(h,w)
%              disp('ver');
%              
%             tmp = secondCol(h,w,:);
%             secondCol(h,w,:) = firstCol(h,w,:);
%             firstCol(h,w,:) = tmp;
%             tmp = firstHit(h,w);
%             firstHit(h,w) = secondHit(h,w);
%             secondHit(h,w) = tmp;
%         end
%             
%             
%         
%         
%             
%             
%             
%         
%         
%         
%         
%         
%         
%     end 
% end
imageOut = image(uint8(firstCol));

% J = imnoise(firstCol,'salt & pepper',0.02);
% 
% imageOut = image(firstCol);
% imageOut = im2uint8(firstCol);
% imageOut = medfilt2(firstCol);
