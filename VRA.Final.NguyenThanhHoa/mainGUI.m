function varargout = mainGUI(varargin)
% MAINGUI MATLAB code for mainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainGUI

% Last Modified by GUIDE v2.5 10-Dec-2017 23:55:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @mainGUI_OpeningFcn, ...
    'gui_OutputFcn',  @mainGUI_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainGUI is made visible.
function mainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainGUI (see VARARGIN)

% Choose default command line output for mainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.numPopup,'String',{12,20,30,48,60});


% --- Outputs from this function are returned to the command line.
function varargout = mainGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browseBtn.
function browseBtn_Callback(hObject, eventdata, handles)
% hObject    handle to browseBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'},'Select image...');

handles.myImage = imread(strcat(pathname, filename));
% Save original image (oImage) for reset after crop
handles.oImage = handles.myImage;
% Show image in axes1
axes(handles.axes1);
imshow(handles.myImage);
set(handles.filenameLbl,'string',filename);
set(handles.pathLbl,'string',pathname);
% save the updated handles object
guidata(hObject,handles);
% Adjust button (enable)
handles.browseText.Visible = 'Off';
handles.cropBtn.Enable = 'On';
handles.searchBtn.Enable = 'On';
handles.rstBtn.Enable = 'On';


function filenameLbl_Callback(hObject, eventdata, handles)
% hObject    handle to filenameLbl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filenameLbl as text
%        str2double(get(hObject,'String')) returns contents of filenameLbl as a double


% --- Executes during object creation, after setting all properties.
function filenameLbl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filenameLbl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pathLbl_Callback(hObject, eventdata, handles)
% hObject    handle to pathLbl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pathLbl as text
%        str2double(get(hObject,'String')) returns contents of pathLbl as a double


% --- Executes during object creation, after setting all properties.
function pathLbl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pathLbl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in searchBtn.
function searchBtn_Callback(hObject, eventdata, handles)
% hObject    handle to searchBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Adjust button (enable)
handles.cropBtn.Enable = 'Off';
handles.browseBtn.Enable = 'Off';
handles.rstBtn.Enable = 'Off';
handles.searchBtn.Enable = 'Off';
handles.numResult = str2double(handles.numPopup.String{handles.numPopup.Value});
[thumbnails, result, scores, queryWords,parisImageIndex,imageIDs] = mainImageRetrieval(handles.myImage,handles.numResult);
montage(thumbnails,'Parent',handles.axes2);
handles.result = result;
handles.queryWords = queryWords;
handles.parisImageIndex = parisImageIndex;
handles.imageIDs = imageIDs;
% Adjust button (enable)
handles.cropBtn.Enable = 'On';
handles.browseBtn.Enable = 'On';
handles.rstBtn.Enable = 'On';
handles.searchBtn.Enable = 'On';
handles.bestBtn.Enable = 'On';
handles.resultPopup.Enable = 'On';
handles.showBtn.Enable = 'On';
handles.compareBtn.Enable = 'On';
%Change result popup
temp = strtrim(cellstr(num2str([1:handles.numResult]'))');
set(handles.resultPopup,'String',temp);
% save the updated handles object
guidata(hObject,handles);

% --- Executes on button press in cropBtn.
function cropBtn_Callback(hObject, eventdata, handles)
% hObject    handle to cropBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
crophlpMess = {'Click and drag out a rectangle.';
    'Double-click inside rectangle to accept it, or type Esc to cancel'};
% uiwait(helpdlg(crophlpMess,'Crop Image Tips'));
set(handles.hlpText,'string',crophlpMess);
handles.cropBtn.Enable = 'Off';
axes(handles.axes1);
gca = handles.axes1;
hRect = imrect(gca);
pos = wait(hRect);
if isempty(pos)
    delete(hRect);
else
    handles.myImage = imcrop(handles.myImage,pos);
    imshow(handles.myImage);
    % save the updated handles object
    guidata(hObject,handles);
end
handles.cropBtn.Enable = 'On';
set(handles.hlpText,'string','');


% --- Executes on button press in rstBtn.
function rstBtn_Callback(hObject, eventdata, handles)
% hObject    handle to rstBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.myImage = handles.oImage;
axes(handles.axes1);
imshow(handles.myImage);
% save the updated handles object
guidata(hObject,handles);


% --- Executes on button press in showBtn.
function showBtn_Callback(hObject, eventdata, handles)
% hObject    handle to showBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedValue = str2double(handles.resultPopup.String{handles.resultPopup.Value});
figure('Name',sprintf('Result: %s',handles.resultPopup.String{handles.resultPopup.Value}),'NumberTitle','off');
imshow(handles.result{selectedValue});

% --- Executes on selection change in resultPopup.
function resultPopup_Callback(hObject, eventdata, handles)
% hObject    handle to resultPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns resultPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from resultPopup

% --- Executes during object creation, after setting all properties.
function resultPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bestBtn.
function bestBtn_Callback(hObject, eventdata, handles)
% hObject    handle to bestBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure('Name','Best match image');
imshowpair(handles.myImage,imread(handles.result{1}),'montage');

% --- Executes on selection change in numPopup.
function numPopup_Callback(hObject, eventdata, handles)
% hObject    handle to numPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns numPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from numPopup


% --- Executes during object creation, after setting all properties.
function numPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in compareBtn.
function compareBtn_Callback(hObject, eventdata, handles)
% hObject    handle to compareBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedValue = str2double(handles.resultPopup.String{handles.resultPopup.Value});
currentImage = handles.imageIDs(selectedValue);

bestMatchWords = handles.parisImageIndex.ImageWords(currentImage);
bestImage = imread(handles.parisImageIndex.ImageLocation{currentImage});
queryWordsIndex     = handles.queryWords.WordIndex;
bestMatchWordIndex  = bestMatchWords.WordIndex;

tentativeMatches = [];
for i = 1:numel(handles.queryWords.WordIndex)
    idx = find(queryWordsIndex(i) == bestMatchWordIndex);
    matches = [repmat(i, numel(idx), 1) idx];
    tentativeMatches = [tentativeMatches; matches];
end
points1 = handles.queryWords.Location(tentativeMatches(:,1),:);
points2 = bestMatchWords.Location(tentativeMatches(:,2),:);
figure
showMatchedFeatures(handles.myImage,bestImage,points1,points2,'montage');

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over compareBtn.
function compareBtn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to compareBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
