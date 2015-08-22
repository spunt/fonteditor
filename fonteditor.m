function fige = fonteditor(figh)    
if nargin==0, figh = gcf; end
fgcolor        = [248/255 248/255 248/255];
bgcolor        = [20/255 23/255 24/255] * 2;


h   = findall(figh, '-property', 'FontSize', '-property', 'visible');
nh  = length(h);
set(h, 'FontUnits', 'points');
fige  =  figure( ...
    'Name'                     ,        'Font Editor'      ,...
    'Units'                    ,        'pix'              ,...
    'Position'                 ,        [100 100 400 nh*40]  ,...
    'Resize'                   ,        'on'           ,...
    'Color'                    ,        bgcolor             ,...
    'Renderer'                 ,        'zbuffer'           ,...
    'NumberTitle'              ,        'off'               ,...
    'DockControls'             ,        'off'               ,...
    'MenuBar'                  ,        'none'              ,...
    'Toolbar'                  ,        'none'              ,...
    'Tag'                      ,        'Font Editor'       ,...
    'WindowStyle'              ,        'normal'            ,...
    'Visible'                  ,        'on'                ,...
    'CloseRequestFcn'          ,        'closereq'          ,...
    'DefaultTextColor'         ,        fgcolor             ,...
    'DefaultLineColor'         ,        fgcolor             ,...
    'DefaultTextFontName'      ,        'Arial'             ,...
    'DefaultAxesFontName'      ,        'Arial'             ,...
    'DefaultUicontrolFontName' ,        'Arial'             ,...
    'DefaultTextFontSize'      ,        12                  ,...
    'DefaultUicontrolFontSize' ,        12                   ...
                        );
panpos = getpositions(1, ones(nh+1,1)', .025, .015);
hpantit = uipanel('Units'    ,     'normalized'                           ,...
                  'Parent'   ,     fige                            ,...
                     'Tag'   ,     'Header Row'                        ,...
                   'Title'   ,     ''                      ,...
                'Position'   ,     panpos(end,3:end)          ,...
         'BackgroundColor'   ,     bgcolor               ,...
         'ForegroundColor'   ,     bgcolor              ,...
              'BorderType'   ,     'none'                                 ,...
             'BorderWidth'   ,     1                                ,...
               'FontAngle'   ,     'normal'                               ,...
                'FontName'   ,     'arial'                                ,...
                'FontSize'   ,     18                               ,...
               'FontUnits'   ,     'points'                               ,...
              'FontWeight'   ,     'bold'                                 ,...
          'HighlightColor'   ,     bgcolor                                ,...
             'ShadowColor'   ,     bgcolor                 ,...
          'SizeChangedFcn'   ,     ''                                     ,...
           'UIContextMenu'   ,     []                                     ,...
                'UserData'   ,     []                                     ,...
                 'Visible'   ,     'on'                                    ...
                            );
                 ptit1  =  uicontrol( ...
                   'Style'   ,     'text'                                 ,...
                  'Parent'   ,     hpantit                           ,...
                     'Tag'   ,     'String'                        ,...
                  'String'   ,     'String'                     ,...
                   'Units'   ,     'normalized'                           ,...
                'Position'   ,     [0 .0 .74 1]          ,...
         'BackgroundColor'   ,     bgcolor               ,...
         'ForegroundColor'   ,     fgcolor              ,...
              'Listboxtop'   ,     1                                      ,...
                     'Max'   ,     1                                    ,...
                     'Min'   ,     0                                      ,...
                   'Value'   ,     0                                      ,...
     'HorizontalAlignment'   ,     'left'                           ,...
           'TooltipString'   ,     ''                                     ,...
                'Callback'   ,     ''                                     ,...
               'FontAngle'   ,     'normal'                               ,...
                'FontSize'   ,     18                                    ,...
               'FontUnits'   ,     'points'                               ,...
              'FontWeight'   ,     'bold'                               ,...
                'UserData'   ,     []                                     ,...
                 'Visible'   ,     'on'                                    ...
                        );
                    
   ptit2  =  uicontrol( ...
                   'Style'   ,     'text'                                 ,...
                  'Parent'   ,    hpantit                            ,...
                     'Tag'   ,     'Font Size'                        ,...
                  'String'   ,     'Size (Points)'                  , ...
                   'Units'   ,     'normalized'                           ,...
                'Position'   ,     [.75 .0 .25 1]          ,...
         'BackgroundColor'   ,     bgcolor               ,...
         'ForegroundColor'   ,     fgcolor              ,...
              'Listboxtop'   ,     1                                      ,...
                     'Max'   ,     1                                    ,...
                     'Min'   ,     0                                      ,...
                   'Value'   ,     0                                      ,...
     'HorizontalAlignment'   ,     'center'                           ,...
           'TooltipString'   ,     ''                                     ,...
                'Callback'   ,     ''                                     ,...
               'FontAngle'   ,     'normal'                               ,...
                'FontName'   ,     'fixed-width'                          ,...
                   'FontUnits'   ,     'points'                               ,...
                'FontSize'   ,     18                                  ,...
              'FontWeight'   ,     'bold'                               ,...
                'UserData'   ,     []                                     ,...
                 'Visible'   ,     'on'                                    ...
                        );                  

                    
panpos(end,:) = [];
panpos = sortrows(panpos, -4);
for i = 1:nh


    ch = h(i);
    typ = get(ch, 'type');
    fs = sprintf('%2.1f', get(ch, 'FontSize')); 
    switch typ
        case {'axes' 'uipanel'}
            str = 'TICK LABELS'; 
            enb = 'off'; 
        otherwise
            str = get(ch, 'string');
            enb = 'on';
    end
    
    
    hpan(i)  =  uipanel( ...
                   'Units'   ,     'normalized'                           ,...
                  'Parent'   ,     fige                            ,...
                     'Tag'   ,     'Editor Panel'                        ,...
                   'Title'   ,     ''                      ,...
                'Position'   ,     panpos(i,3:end)          ,...
         'BackgroundColor'   ,     bgcolor               ,...
         'ForegroundColor'   ,     bgcolor              ,...
              'BorderType'   ,     'none'                                 ,...
             'BorderWidth'   ,     1                                ,...
               'FontAngle'   ,     'normal'                               ,...
                'FontName'   ,     'arial'                                ,...
                'FontSize'   ,     12                               ,...
               'FontUnits'   ,     'points'                               ,...
              'FontWeight'   ,     'bold'                                 ,...
          'HighlightColor'   ,     bgcolor                                ,...
             'ShadowColor'   ,     bgcolor                 ,...
          'SizeChangedFcn'   ,     ''                                     ,...
           'UIContextMenu'   ,     []                                     ,...
                'UserData'   ,     []                                     ,...
                 'Visible'   ,     'on'                                    ...
                            );

    hedit(i)  =  uicontrol( ...
                   'Style'   ,     'edit'                                 ,...
                  'Parent'   ,     hpan(i)                            ,...
                     'Tag'   ,     'String'                        ,...
                  'String'   ,     str                     ,...
                   'Units'   ,     'normalized'                           ,...
                'Position'   ,     [0 .0 .74 1]          ,...
         'BackgroundColor'   ,     fgcolor               ,...
         'ForegroundColor'   ,     bgcolor              ,...
              'Listboxtop'   ,     1                                      ,...
                     'Max'   ,     1                                    ,...
                     'Min'   ,     0                                      ,...
                   'Value'   ,     0                                      ,...
     'HorizontalAlignment'   ,     'left'                           ,...
                  'Enable'   ,     enb                                   ,...
           'TooltipString'   ,     ''                                     ,...
                'Callback'   ,     ''                                     ,...
               'FontAngle'   ,     'normal'                               ,...
                'FontSize'   ,     18                                    ,...
               'FontUnits'   ,     'points'                               ,...
              'FontWeight'   ,     'normal'                               ,...
                'UserData'   ,     []                                     ,...
                'Callback'   , {@cb_updatestring, ch} ,...
                 'Visible'   ,     'on'                                    ...
                        );
                    
    feditfontsz(i)  =  uicontrol( ...
                   'Style'   ,     'edit'                                 ,...
                  'Parent'   ,     hpan(i)                            ,...
                     'Tag'   ,     'Font Size'                        ,...
                  'String'   ,     fs                  , ...
                   'Units'   ,     'normalized'                           ,...
                'Position'   ,     [.75 .0 .25 1]          ,...
         'BackgroundColor'   ,     fgcolor               ,...
         'ForegroundColor'   ,     bgcolor              ,...
              'Listboxtop'   ,     1                                      ,...
                     'Max'   ,     1                                    ,...
                     'Min'   ,     0                                      ,...
                   'Value'   ,     0                                      ,...
     'HorizontalAlignment'   ,     'center'                           ,...
                  'Enable'   ,     'on'                                   ,...
           'TooltipString'   ,     ''                                     ,...
                'Callback'   ,     ''                                     ,...
               'FontAngle'   ,     'normal'                               ,...
                'FontName'   ,     'fixed-width'                          ,...
                   'FontUnits'   ,     'points'                               ,...
                'FontSize'   ,     18                                  ,...
              'FontWeight'   ,     'normal'                               ,...
                'UserData'   ,     []                                     ,...
                'Callback'   , {@cb_updatesize, ch} ,...
                 'Visible'   ,     'on'                                    ...
                        );          

end
fixuilabels
end
function cb_updatesize(varargin)
    if isnan(str2double(get(varargin{1}, 'string')))
        set(varargin{1}, 'string', sprintf('%2.1f', get(varargin{3}, 'fontsize')));
        return;
    end
    set(varargin{3}, 'fontsize', str2num(get(varargin{1}, 'string')));
end
function cb_updatestring(varargin)
try
    set(varargin{3}, 'string', get(varargin{1}, 'string'));
catch
    warning('Could not update string! Reverting to original string'); 
    set(varargin{1}, 'string', get(varargin{3}, 'string'));
end

end
function pos = getpositions(relwidth, relheight, marginsep, uicontrolsep)
if nargin<2, relheight = [6 7]; end
if nargin<3, marginsep = .025; end
if nargin<4, uicontrolsep = .01; end
ncol = length(relwidth);
nrow = length(relheight); 

% width
rowwidth    = 1-(marginsep*2)-(uicontrolsep*(ncol-1));  
uiwidths    = (relwidth/sum(relwidth))*rowwidth;
allsep      = [marginsep repmat(uicontrolsep, 1, ncol-1)];
uilefts     = ([0 cumsum(uiwidths(1:end-1))]) + cumsum(allsep); 

% height
colheight   = 1-(marginsep*2)-(uicontrolsep*(nrow-1));
uiheights   = (relheight/sum(relheight))*colheight;
allsep      = [marginsep repmat(uicontrolsep, 1, nrow-1)];
uibottoms   = ([0 cumsum(uiheights(1:end-1))]) + cumsum(allsep);

% combine
pos = zeros(ncol, 4, nrow);
pos(:,1,:)  = repmat(uilefts', 1, nrow); 
pos(:,2,:)  = repmat(uibottoms, ncol, 1);
pos(:,3,:)  = repmat(uiwidths', 1, nrow);
pos(:,4,:)  = repmat(uiheights, ncol, 1);

% test
pos = zeros(ncol*nrow, 6);
pos(:,1) = reshape(repmat(1:nrow, ncol, 1), size(pos,1), 1);
pos(:,2) = reshape(repmat(1:ncol, 1, nrow), size(pos,1), 1);
pos(:,3) = uilefts(pos(:,2)); 
pos(:,4) = uibottoms(pos(:,1)); 
pos(:,5) = uiwidths(pos(:,2)); 
pos(:,6) = uiheights(pos(:,1)); 

end
% | FIXUILABELS - Copyright 2013 Takeshi Ikuma
function fixuilabels(hFig)
%FIXUILABELS   Change 'text' uicontrol objects' vertical alignment
%   FIXUILABELS traverses through the java objects contained within the
%   current MATLAB figure and adjust the underlying java objects for all
%   the 'text' style uicontrols so that their texts better line up with the
%   adjacent 'edit' style uicontrols at the same height.
%
%   FIXUILABELS(FIG) fixes the uicontrols in the figure with handle FIG.
%
%   ACKNOWLEDGEMENT: This function is based on Yair Altman's findobj
%   (http://www.mathworks.com/matlabcentral/fileexchange/14317)

% Copyright 2013 Takeshi Ikuma
% History:
% rev. - : (06-10-2013) original release


% Ensure Java AWT is enabled
error(javachk('awt'));

error(nargchk(0,1,nargin));

% Get figure
if nargin<1
   hFig = getCurrentFigure;
else
   if ~(numel(hFig)==1 && ishghandle(hFig) && strcmp(get(hFig,'type'),'figure'))
      error('FIG does not appear to be a valid figure handle.');
   end
end

drawnow;

try
   % Default container is the current figure's root panel
   container = getRootPanel(hFig);
   
   % Traverse the container hierarchy and adjust the label objects
   traverseContainer(container);
   
catch ME
   % 'Cleaner' error handling - strip the stack info etc.
   err = MException.last;
   err.message = regexprep(err.message,'Error using ==> [^\n]+\n','');
   if isempty(strfind(err.message,mfilename))
      err.message = [mfilename ': ' err.message];
   end
   rethrow(err);
end
end
function traverseContainer(jcontainer)

% Record the data for this node
%disp(char(jcontainer.toString))
if isa(jcontainer,'com.mathworks.hg.peer.LabelPeer$1')
   jcontainer.setVerticalAlignment(0); % "middle" aligned
end

% Programmed and Copyright by Yair M. Altman: altmany(at)gmail.com
% $Revision: 1.38 $  $Date: 2013/05/15 21:58:17 $
lastChildComponent = java.lang.Object;
child = 0;
try % try to terminate recursion when jcontainer does not have ComponentCount property
   while (child < jcontainer.getComponentCount)
      childComponent = jcontainer.getComponent(child);

      % Looping over menus sometimes causes jcontainer to get mixed up (probably a JITC bug), so identify & fix
      if isequal(childComponent,lastChildComponent)
         child = child + 1;
         childComponent = jcontainer.getComponent(child);
      end
      lastChildComponent = childComponent;
      traverseContainer(childComponent) % returns true if LabelPeer object
      child = child + 1;
   end
catch
end
end
function curFig = getCurrentFigure
% Programmed and Copyright by Yair M. Altman: altmany(at)gmail.com
% $Revision: 1.38 $  $Date: 2013/05/15 21:58:17 $

oldShowHidden = get(0,'ShowHiddenHandles');
set(0,'ShowHiddenHandles','on');  % minor fix per Johnny Smith
curFig = gcf;
set(0,'ShowHiddenHandles',oldShowHidden);

end
function jRootPane = getRootPanel(hFig)
% Programmed and Copyright by Yair M. Altman: altmany(at)gmail.com
% $Revision: 1.38 $  $Date: 2013/05/15 21:58:17 $
try
   jRootPane = hFig;
   figName = get(hFig,'name');
   if strcmpi(get(hFig,'number'),'on')
      figName = regexprep(['Figure ' num2str(hFig) ': ' figName],': $','');
   end
   mde = com.mathworks.mde.desk.MLDesktop.getInstance;
   jFigPanel = mde.getClient(figName);
   jRootPane = jFigPanel;
   jRootPane = jFigPanel.getRootPane;
catch
   try
      warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');  % R2008b compatibility
      jFrame = get(hFig,'JavaFrame');
      jFigPanel = get(jFrame,'FigurePanelContainer');
      jRootPane = jFigPanel;
      jRootPane = jFigPanel.getComponent(0).getRootPane;
   catch
      % Never mind
   end
end

try
   % If invalid RootPane - try another method...
   warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');  % R2008b compatibility
   jFrame = get(hFig,'JavaFrame');
   jAxisComponent = get(jFrame,'AxisComponent');
   jRootPane = jAxisComponent.getParent.getParent.getRootPane;
catch
   % Never mind
end
try
   % If invalid RootPane, retry up to N times
   tries = 10;
   while isempty(jRootPane) && tries>0  % might happen if figure is still undergoing rendering...
      drawnow; pause(0.001);
      tries = tries - 1;
      jRootPane = jFigPanel.getComponent(0).getRootPane;
   end
   
   % If still invalid, use FigurePanelContainer which is good enough in 99% of cases... (menu/tool bars won't be accessible, though)
   if isempty(jRootPane)
      jRootPane = jFigPanel;
   end
   % Try to get the ancestor FigureFrame
   jRootPane = jRootPane.getTopLevelAncestor;
catch
   % Never mind - FigurePanelContainer is good enough in 99% of cases... (menu/tool bars won't be accessible, though)
end

end



