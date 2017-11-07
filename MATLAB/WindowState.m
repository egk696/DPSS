function windowState = WindowState(WAccel, WGyro, WLength)
%WindowState ��������� �������� ������������� ������ �� ��� �������� ���������
%   ���� ��������� ���� ���������� � ���������� �������� ��� ������������
%   ��� �������� 4.3.1. ����� ���������� �� ��������� ��� ���� WGyro, ����
%   �������� ��������� � ��������� ��� ������������ �� ��������� �� ���� ��
%   �������� �������� ��� ����� ���� ������� �������� ��� �� ��� �����
%   ��������� ������������ � ������ ��������� ��� ������������� ��� ������
%   ��� �� �������� ��� ��������� �����.
    dGyro = diff(WGyro);
    dGyroF = DiffGyroFrequency(dGyro);
    idling = WAccel(1:WLength,3)==1 & dGyroF(2) < 0.25 & dGyroF(3) < 0.25;
    moving = ~idling & WAccel(1:WLength,3)>=1;
    falling = (~moving & ~idling) & (WAccel(1:WLength,1) >=1 | WAccel(1:WLength,2) >=1);
    windowState = [idling'; moving'; falling']';
end