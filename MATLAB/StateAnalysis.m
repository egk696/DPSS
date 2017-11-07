function States = StateAnalysis(Accel, Gyro, frameStart, frameStep, frameCount)
%StateAnalysis ��������� �������� ��������� ��������� �� ��� �����
%   ���������� ���������.
%   ���� ��������� ���� ���������� ���� ������� ���������� ��� ��� ��������
%   ��������� ����� ������ ����� ��� ������� ������ (frameCount) ���� �����
%   �������� � ��������� WindowState. ����� � ��������� ���� ���������� ���
%   ������� ����������� ��� ��� ������������ ��� ������ ��� �� ������ ���
%   ���� ������.
    for i=frameStart:frameStep:frameCount
        if(i>1)
            WStart = i-1;
        else
            WStart = i;
        end
        IndexStart = WStart;
        IndexFinish = IndexStart+frameStep-1;
        States(IndexStart:IndexFinish,:) = WindowState(Accel(WStart:(WStart+frameStep),:), Gyro(WStart:(WStart+frameStep),:), frameStep);
    end
end