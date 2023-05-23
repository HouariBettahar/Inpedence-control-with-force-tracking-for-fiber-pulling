function [Y,X0,str,ts] = PI_M404(t,X,Target,flag)


 persistent PIdevice;
% sys = valeur retourn?e
% X0 = ?tat initial


switch flag,

%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
% Opening, connection, initialization, loading
%=============================================================================                              



case 0,

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

Y = simsizes(sizes);
X0 = [];
str = [];
ts  = [0 0];

PIdevice = PI_GCS_Controller ();

boolPIdeviceConnected = false; if ( exist ( 'PIdevice', 'var' ) ), if ( PIdevice.IsConnected ), boolPIdeviceConnected = true; end; end;


if ( ~(boolPIdeviceConnected ) )
% Please choose the connection type you need.  

controllerSerialNumber='119035525';
    
%     % RS232
    comPort = 1;          % Look at the Device Manager to get the correct COM Port.
    baudRate = 57600;    % Look at the manual to get the correct bau rate for your controller.
 
    
%     PIdevice = PIdevice.ConnectRS232( comPort, baudRate );
    
     PIdevice = PIdevice.ConnectUSB(controllerSerialNumber);
    
end

%% Configuration and referencing

% % query controller axes
% availableaxes = PIdevice.qSAI_ALLasArray;
% if(isempty(availableaxes))
% 	error('No axes available');
% end
% axisname = availableaxes{1};
%                                                                                                                                              
% % switch on servo and search reference switch to reference stage
% PIdevice.SVO(axisname,1);
%                                                             
% PIdevice.FRF(axisname)                                        
% bReferencing = 1;                                         
% % wait for Referencing to finish                          
% while(0 ~= PIdevice.qFRF(axisname)==0)                        
%     pause(0.1);                                           
% end             
% 
% %% Configuration and referencing
% 
% % query controller axes
% availableaxes = PIdevice.qSAI_ALLasArray;
% if(isempty(availableaxes))
% 	error('No axes available');
% end
% axisname = availableaxes{2};
%                                                                                                                                              
% % switch on servo and search reference switch to reference stage
% PIdevice.SVO(axisname,2);
%                                                             
% PIdevice.FRF(axisname)                                        
% bReferencing = 2;                                         
% % wait for Referencing to finish                          
% while(0 ~= PIdevice.qFRF(axisname)==0)                        
%     pause(0.1);                                           
% end   
% 
% %% Configuration and referencing
% 
% % query controller axes
% availableaxes = PIdevice.qSAI_ALLasArray;
% if(isempty(availableaxes))
% 	error('No axes available');
% end
% axisname = availableaxes{3};
%                                                                                                                                              
% % switch on servo and search reference switch to reference stage
% PIdevice.SVO(axisname,3);
%                                                             
% PIdevice.FRF(axisname)                                        
% bReferencing = 3;                                         
% % wait for Referencing to finish                          
% while(0 ~= PIdevice.qFRF(axisname)==0)                        
%     pause(0.1);                                           
% end   

%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
  case 3,

     
PIdevice.MOV('1',Target(1));
% while PIdevice.ISMoving('1')
%     pause(0.1);
%    PIdevice.qPOS('1');
% end

Y(1)=PIdevice.qPOS('1');




%=============================================================================
% mdlTerminate
% Closing
%=============================================================================
  case 9,
PIdevice.CloseConnection;

PIdevice.Destroy;
clear Controller;
clear PIdevice;

Y=[];

%=============================================================================
% Unhandled flags 
%=============================================================================
  case { 1, 2, 4 },
     
Y = [];

%=============================================================================
% Unexpected flags %
%=============================================================================
  otherwise
     
     error(['Unhandled flag = ',num2str(flag)]);

end
