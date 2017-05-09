function frame = msReadFrameRGB(ms,frameNum,columnCorrect, align, dFF)
% function frame = msReadFrameRGB(ms,frameNum,columnCorrect, align, dFF)
% Read video frame(s) from a video object. Ensure it is a 3D array (RGB)
% frame. Fail if a grayscale (2d matrix) frame found.
% 
    
    vidNum = ms.vidNum(frameNum);
    vidFrameNum = ms.frameNum(frameNum);    
    frame = double(ms.vidObj{vidNum}.read(vidFrameNum));
    
    if numel(size(frame)) ~= 3
        error('msReadFrameRGB: non 3D array (grayscale?) frame found');
    end
    %{
    if (columnCorrect)
        frame = frame - ms.columnCorrection + ms.columnCorrectionOffset;
    end
    if (align)
        frame = frame(((max(ms.hShift(:,ms.selectedAlignment))+1):(end+min(ms.hShift(:,ms.selectedAlignment))-1))-ms.hShift(frameNum,ms.selectedAlignment), ...
                      ((max(ms.wShift(:,ms.selectedAlignment))+1):(end+min(ms.wShift(:,ms.selectedAlignment))-1))-ms.wShift(frameNum,ms.selectedAlignment));
    end
    if (dFF)
%         idx = ms.minFrame{ms.selectedAlignment}<80;
%         frame = frame./ms.minFrame{ms.selectedAlignment}-1;
%         frame = frame./ms.meanFrame{ms.selectedAlignment}-1;
%         frame(idx) = 0;
    end
    %}
end

