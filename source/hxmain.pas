unit hxMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  StdCtrls, ComCtrls, mrumanager,
  hxGlobal, hxHexEditorFrame;

type

  { TMainForm }

  TMainForm = class(TForm)
    acFileNew: TAction;
    acFileOpen: TAction;
    acFileQuit: TAction;
    acShowStatusbar: TAction;
    acShowToolbar: TAction;
    acShowStdViewer: TAction;
    acCfgSettings: TAction;
    acFileClose: TAction;
    acFileCloseAll: TAction;
    acFileSave: TAction;
    acFileSaveAs: TAction;
    acSetBookmark0: TAction;
    acSetBookmark1: TAction;
    acSetBookmark2: TAction;
    acSetBookmark3: TAction;
    acSetBookmark4: TAction;
    acSetBookmark5: TAction;
    acSetBookmark6: TAction;
    acSetBookmark7: TAction;
    acSetBookmark8: TAction;
    acSetBookmark9: TAction;
    acGotoBookmark0: TAction;
    acGotoBookmark9: TAction;
    acGotoBookmark1: TAction;
    acGotoBookmark2: TAction;
    acGotoBookmark3: TAction;
    acGotoBookmark4: TAction;
    acGotoBookmark5: TAction;
    acGotoBookmark6: TAction;
    acGotoBookmark7: TAction;
    acGotoBookmark8: TAction;
    acClearBookmark0: TAction;
    acClearBookmark9: TAction;
    acClearBookmark1: TAction;
    acClearBookmark2: TAction;
    acClearBookmark3: TAction;
    acClearBookmark4: TAction;
    acClearBookmark5: TAction;
    acClearBookmark6: TAction;
    acClearBookmark7: TAction;
    acClearBookmark8: TAction;
    acGoTo: TAction;
    acEditInsertMode: TAction;
    acEditOverWriteMode: TAction;
    acEditEditingForbidden: TAction;
    acEditEditingAllowed: TAction;
    acGoToRepeat: TAction;
    acGotoBackward: TAction;
    ActionList: TActionList;
    CoolBar1: TCoolBar;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    mnuEdit: TMenuItem;
    mnuGoto: TMenuItem;
    mnuClearBookmark5: TMenuItem;
    mnuClearBookmark6: TMenuItem;
    mnuClearBookmark7: TMenuItem;
    mnuClearBookmark8: TMenuItem;
    mnuClearBookmark9: TMenuItem;
    mnuClearBookmark0: TMenuItem;
    mnuClearBookmark1: TMenuItem;
    mnuClearBookmark2: TMenuItem;
    mnuClearBookmark3: TMenuItem;
    mnuClearBookmark4: TMenuItem;
    mnuSetBookmark5: TMenuItem;
    mnuSetBookmark6: TMenuItem;
    mnuSetBookmark7: TMenuItem;
    mnuSetBookmark8: TMenuItem;
    mnuSetBookmark9: TMenuItem;
    mnuSetBookmark0: TMenuItem;
    mnuGotoBookmark1: TMenuItem;
    mnuGotoBookmark2: TMenuItem;
    mnuGotoBookmark3: TMenuItem;
    mnuGotoBookmark4: TMenuItem;
    MenuItem2: TMenuItem;
    mnuGotoBookmark5: TMenuItem;
    mnuGotoBookmark6: TMenuItem;
    mnuGotoBookmark7: TMenuItem;
    mnuGotoBookmark8: TMenuItem;
    mnuGotoBookmark9: TMenuItem;
    mnuGotoBookmark0: TMenuItem;
    MenuItem3: TMenuItem;
    mnuSetBookmark1: TMenuItem;
    mnuSetBookmark2: TMenuItem;
    mnuSetBookmark3: TMenuItem;
    mnuSetBookmark4: TMenuItem;
    mnuClearBookmarks: TMenuItem;
    mnuGotoBookmarks: TMenuItem;
    mnuSetBookmarks: TMenuItem;
    mnuNavigation: TMenuItem;
    mnuHelpAbout: TMenuItem;
    mnuHelp: TMenuItem;
    mnuFileSave: TMenuItem;
    MenuItem5: TMenuItem;
    mnuFileSaveAs: TMenuItem;
    mnuFileClose: TMenuItem;
    mnuFileCloseAll: TMenuItem;
    MenuItem9: TMenuItem;
    mnuGlobalSettings: TMenuItem;
    mnuConfig: TMenuItem;
    mnuView: TMenuItem;
    mnuRecentlyOpened: TMenuItem;
    mnuFile: TMenuItem;
    mnuFileNew: TMenuItem;
    mnuFileOpen: TMenuItem;
    mnuFileQuit: TMenuItem;
    OpenDialog: TOpenDialog;
    PageControl: TPageControl;
    RecentFilesPopup: TPopupMenu;
    SaveDialog: TSaveDialog;
    ToolBar: TToolBar;
    tbFileOpen: TToolButton;
    tbFileQuit: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure acBookmarkClear(Sender: TObject);
    procedure acBookmarkGoto(Sender: TObject);
    procedure acBookmarkSet(Sender: TObject);
    procedure acCfgSettingsExecute(Sender: TObject);
    procedure acEditMode(Sender: TObject);
    procedure acEditInsertOverwriteModeExecute(Sender: TObject);
    procedure acEditEditingForbiddenExecute(Sender: TObject);
    procedure acFileCloseAllExecute(Sender: TObject);
    procedure acFileCloseExecute(Sender: TObject);
    procedure acFileNewExecute(Sender: TObject);
    procedure acFileOpenExecute(Sender: TObject);
    procedure acFileQuitExecute(Sender: TObject);
    procedure acFileSaveAsExecute(Sender: TObject);
    procedure acFileSaveExecute(Sender: TObject);
    procedure acGoToExecute(Sender: TObject);
    procedure acGoToRepeatExecute(Sender: TObject);
    procedure acShowStatusbarExecute(Sender: TObject);
    procedure acShowToolbarExecute(Sender: TObject);
    procedure ActionListUpdate({%H-}AAction: TBasicAction; var {%H-}Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
  private
    FRecentFilesManager: TMRUMenuManager;

    procedure ApplyParams(const AParams: THexParams);
    procedure EvalCmdLine;
    function GetActiveHexEditorFrame: THexEditorFrame;
    function GetHexEditorFrame(APageIndex: Integer): THexEditorFrame;
    procedure HexEditorChanged(Sender: TObject);

    procedure RecentFileHandler(Sender: TObject; const AFileName: String);
    procedure ShowStatusbar(AEnable: boolean);
    procedure ShowNumViewer(AEnable: Boolean);
    procedure ShowToolbar(AEnable: boolean);
    procedure UpdateCaption;
    procedure UpdateCmds;

    procedure ReadIni;
    procedure WriteIni;

  public
    procedure CreateEditor(const AFileName: String; WriteProtected: Boolean);

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

uses
  IniFiles, Math,
  MPHexEditor,
  hxStrings, hxUtils, {%H-}hxDataModule, hxSettingsDlg, hxGotoDlg;

const
  PROG_NAME = 'Hex';
  TAG_SET_BOOKMARK = 7000;
  TAG_GOTO_BOOKMARK = 7100;
  TAG_CLEAR_BOOKMARK = 7200;


{ TMainForm }

procedure TMainForm.acBookmarkClear(Sender: TObject);
var
  i, idx: integer;
  ac: TAction;
  F: THexEditorFrame;
  bm: TMPHBookmark;
begin
  inherited;
  F := GetActiveHexEditorFrame;
  if Assigned(F) then begin
    bm.MPosition := -1;
    idx := (Sender as TAction).Tag - TAG_CLEAR_BOOKMARK;
    F.HexEditor.Bookmark[idx] := bm;
    for i := 0 to ActionList.ActionCount - 1 do begin
      ac := TAction(ActionList[i]);
      if ac.Tag - TAG_SET_BOOKMARK = idx then
        ac.Checked := false;
      if ac.Tag - TAG_GOTO_BOOKMARK = idx then
        ac.Enabled := false;
      if ac.Tag - TAG_CLEAR_BOOKMARK = idx then
        ac.Enabled := false;
    end;
  end;
end;

procedure TMainForm.acBookmarkGoto(Sender:TObject);
var
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then
    F.HexEditor.GotoBookmark((Sender as TAction).Tag - TAG_GOTO_BOOKMARK);
end;

procedure TMainForm.acBookmarkSet(Sender: TObject);
var
  i : integer;
  ac : TAction;
  F: THexEditorFrame;
  bm: TMPHBookmark;
  idx: Integer;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then
  begin
    idx := (Sender as TAction).Tag - TAG_SET_BOOKMARK;
    bm.mPosition := F.HexEditor.GetCursorPos; //SelStart;
    bm.mInCharField := F.HexEditor.InCharField;
    F.HexEditor.Bookmark[idx] := bm;
    (Sender as TAction).Checked := true;
    for i := 0 to ActionList.ActionCount - 1 do begin
      ac := TAction(ActionList[i]);
      if ac.Tag - TAG_SET_BOOKMARK = idx then
        ac.Checked := true;
      if ac.Tag - TAG_GOTO_BOOKMARK = idx then
        ac.Enabled := true;
      if ac.Tag - TAG_CLEAR_BOOKMARK = idx then
        ac.Enabled := true;
    end;
  end;
end;

procedure TMainForm.acCfgSettingsExecute(Sender: TObject);
var
  D: TSettingsForm;
  F: THexEditorFrame;
  params: THexParams;
begin
  F := GetActiveHexEditorFrame;
  D := TSettingsForm.Create(nil);
  try
    if Assigned(F) then
      F.ActiveParams(params{%H-})
    else
      params := HexParams;
    D.ParamsToControls(params);
    if D.ShowModal = mrOK then begin
      D.ParamsFromControls(params);
      if Assigned(F) then
        F.ApplyParams(params)
      else
        HexParams := params;
    end;
  finally
    D.Free;
  end;
end;

procedure TMainForm.acEditInsertOverwriteModeExecute(Sender: TObject);
var
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then
    F.InsertMode(acEditInsertMode.Checked or not acEditOverwriteMode.Checked);
end;

procedure TMainForm.acEditMode(Sender: TObject);
var
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then
    F.HexEditor.ReadOnlyView := acEditEditingForbidden.Checked
  else
    HexParams.ViewOnly := acEditEditingForbidden.Checked;
end;

procedure TMainForm.acEditEditingForbiddenExecute(Sender: TObject);
var
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) and Assigned(F.HexEditor) then
    F.HexEditor.ReadOnlyView := acEditEditingForbidden.Checked;
end;

procedure TMainForm.acFileCloseAllExecute(Sender: TObject);
var
  i: Integer;
  F: THexEditorFrame;
  res: Integer;
begin
  for i := PageControl.PageCount-1 downto 0 do begin
    F := GetHexEditorFrame(i);
    if F.HexEditor.Modified then begin
      PageControl.ActivePageIndex := i;
      PageControlChange(nil);
      res := MessageDlg(SCloseModified, mtConfirmation, [mbYes, mbNo, mbCancel], 0);
      case res of
        mrYes:
          with SaveDialog do begin
            InitialDir := ExtractFileDir(F.Filename);
            FileName := ExtractFileName(F.Filename);
            DefaultExt := '';
            Filter := 'All files (*.*)|*.*';
            if Execute then begin
              Application.ProcessMessages;
              F.SaveFileAs(FileName);
            end else
              Continue;
          end;
        mrNo:
          Continue;
        mrCancel:
          Break;
      end;
    end;
    F.Free;
    PageControl.Pages[i].Free;
  end;

  if PageControl.PageCount = 0 then
    PageControl.Hide;

  UpdateCmds;
  UpdateCaption;
end;

procedure TMainForm.acFileCloseExecute(Sender: TObject);
var
  idx: Integer;
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then begin
    if F.HexEditor.Modified then begin
      if MessageDlg(SCloseModified, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      with SaveDialog do begin
        InitialDir := ExtractFileDir(F.Filename);
        FileName := ExtractFileName(F.Filename);
        DefaultExt := '';
        Filter := 'All files (*.*)|*.*';
        if Execute then begin
          Application.ProcessMessages;
          F.SaveFileAs(FileName);
        end else
          exit;
      end;
    end;
    F.Free;
    idx := PageControl.ActivePageIndex;
    PageControl.ActivePage.Free;
    if idx < PageControl.PageCount then
      PageControl.ActivePageIndex := idx
    else
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
    if PageControl.PageCount > 0 then
      PageControlChange(nil)
    else
      PageControl.Hide;
    UpdateCmds;
    UpdateCaption;
  end;
end;

procedure TMainForm.acFileNewExecute(Sender: TObject);
begin
  CreateEditor('', false);
end;

procedure TMainForm.acFileOpenExecute(Sender: TObject);
var
  i : integer;
begin
  with OpenDialog do begin
    FileName := '*.*';
    Filter := 'All files (*.*)|*.*';
    DefaultExt := '';
    if Execute then begin
      Application.ProcessMessages;
      for i:=0 to Files.Count-1 do
        CreateEditor(Files[i], ofReadOnly in Options);
    end;
  end;
end;

procedure TMainForm.acFileQuitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.acFileSaveAsExecute(Sender: TObject);
var
  F: THexEditorFrame;
begin
  inherited;
  F := GetActiveHexEditorFrame;
  if Assigned(F) then begin
    with SaveDialog do begin
      InitialDir := ExtractFileDir(F.Filename);
      FileName := ExtractFileName(F.Filename);
      DefaultExt := '';
      Filter := 'All files (*.*)|*.*';
      if Execute then begin
        Application.ProcessMessages;
        F.SaveFileAs(FileName);
        HexEditorChanged(self);  // Remove "modified" tag from PageControl tab
      end;
    end;
  end;
end;

procedure TMainForm.acFileSaveExecute(Sender: TObject);
var
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then
    F.SaveFile;
end;

procedure TMainForm.acGoToExecute(Sender: TObject);
var
  F: THexEditorFrame;
  dlg: TGotoForm;
  n: Integer;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then begin
    if (F.HexEditor = nil) or (not F.HexEditor.HasFile) then
      exit;

    dlg := TGotoForm.Create(nil);
    try
      if dlg.ShowModal = mrOK then begin
        if GotoParams.JumpAbs then
          n := GotoParams.PosAbs
        else
          n := F.HexEditor.GetCursorPos + GotoParams.PosRel;
        F.JumpToPosition(n);
      end;
    finally
      dlg.Free;
    end;
  end;
end;

procedure TMainForm.acGoToRepeatExecute(Sender: TObject);
var
  F: THexEditorFrame;
  n: integer;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) and Assigned(F.HexEditor) then //and not (GotoParams.JumpAbs) then
  begin
    if Sender = acGotoRepeat then begin     // jump forward
      if GotoParams.JumpAbs then
        n := GotoParams.PosAbs
      else
        n := F.HexEditor.GetCursorPos + GotoParams.PosRel
    end
    else
    if Sender = acGotoBackward then    // jump backward
    begin
      if GotoParams.JumpAbs then
        exit;
      n := F.HexEditor.GetCursorPos - GotoParams.PosRel
    end
    else
      exit;

    F.JumpToPosition(n);
  end;
end;

procedure TMainForm.acShowStatusbarExecute(Sender: TObject);
begin
  ShowStatusbar(acShowStatusbar.Checked);
end;

procedure TMainForm.acShowToolbarExecute(Sender: TObject);
begin
  ShowToolbar(acShowToolbar.Checked);
end;

procedure TMainForm.ActionListUpdate(AAction: TBasicAction; var Handled: Boolean
  );
var
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then
    F.UpdateStatusBar;
  UpdateCmds;
end;

procedure TMainForm.ApplyParams(const AParams: THexParams);
var
  i: Integer;
  F: THexEditorFrame;
begin
  for i := 0 to PageControl.PageCount-1 do begin
    F := GetHexEditorFrame(i);
    F.ApplyParams(AParams);
  end;
end;

procedure TMainForm.CreateEditor(const AFileName: String; WriteProtected: Boolean);

  function CountEmpty: integer;
  var
    i, n: integer;
    ef: THexEditorFrame;
  begin
    n := 0;
    for i:=0 to PageControl.PageCount-1 do begin
      ef := GetHexEditorFrame(i);
      if ef.HexEditor.HasFile then
        inc(n);
    end;
    Result := n;
  end;

var
  F: THexEditorFrame;
  c: TCursor;
  page: TTabSheet;
begin
  c := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    page := PageControl.AddTabSheet;
    F := THexEditorFrame.Create(self);
    F.Name := '';
    F.Parent := page;
    F.Align := alClient;
    F.OnChange := @HexEditorChanged;
    if AFileName <> '' then begin
      F.OpenFile(AFileName, WriteProtected);
      FRecentFilesManager.AddToRecent(AFileName);
    end else
      F.Caption := Format(SNoName, [CountEmpty]);
    F.ApplyParams(HexParams);
    page.Caption := F.Caption;
    PageControl.ActivePage := page;
    PageControl.Show;
    UpdateCaption;
    UpdateCmds;
  finally
    Screen.Cursor := c;
  end;
end;

procedure TMainForm.EvalCmdLine;
var
  s: string;
  i: integer;
begin
  for i:=1 to ParamCount do begin
    s := UpperCase(ParamStr(i));
    if (s[1]='/') or (s[1]='-') then begin
      //
    end else
      if FileExists(ParamStr(i)) then CreateEditor(ParamStr(i), HexParams.WriteProtected);
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := true;
  try
    WriteIni;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FRecentFilesManager := TMRUMenuManager.Create(self);
  FRecentFilesManager.MenuCaptionMask := '%0:x - %s';
  FRecentFilesManager.MenuItem := mnuRecentlyOpened;
  FRecentFilesManager.PopupMenu := RecentFilesPopup;
  FRecentFilesManager.OnRecentFile := @RecentFileHandler;
  FRecentFilesManager.IniFileName := GetIniFileName;
  FRecentFilesManager.IniSection := 'RecentFiles';

  ReadIni;


  UpdateCmds;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  EvalCmdLine;
end;

function TMainForm.GetActiveHexEditorFrame: THexEditorFrame;
begin
  if PageControl.ActivePage = nil then
    Result := nil
  else
    Result := GetHexEditorFrame(PageControl.ActivePageIndex);
end;

function TMainForm.GetHexEditorFrame(APageIndex: Integer): THexEditorFrame;
begin
  if PageControl.Pages[APageIndex].Controls[0] is THexEditorFrame then
    Result := THexEditorFrame(PageControl.Pages[APageIndex].Controls[0])
  else
    Result := nil;
end;

procedure TMainForm.HexEditorChanged(Sender: TObject);
var
  F: THexEditorFrame;
  i: Integer;
begin
  F := GetActiveHexEditorFrame;
  F.UpdateCaption;
  for i:=0 to PageControl.PageCount-1 do
    if GetHexEditorFrame(i) = F then
    begin
      PageControl.Pages[i].Caption := F.Caption;
      break;
    end;
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  UpdateCaption;
end;

procedure TMainForm.ReadIni;
var
  ini : TCustomIniFile;
begin
  ini := CreateIniFile;
  try
    ReadFormFromIni(ini, self, 'MainForm');
    ShowToolbar(ini.ReadBool('MainForm', 'ShowToolbar', acShowToolbar.Checked));
    ShowStatusbar(ini.ReadBool('MainForm', 'ShowStatusbar', AcShowStatusbar.Checked));
    ReadParamsFromIni(ini, 'Params');
    if HexParams.ViewOnly then
      AcEditEditingForbidden.Checked := true
    else
      AcEditEditingAllowed.Checked := true;
    if HexParams.InsertMode then
      AcEditInsertMode.Checked := true
    else
      AcEditOverwriteMode.Checked := true;
  finally
    ini.Free;
  end;
end;

procedure TMainForm.RecentFileHandler(Sender: TObject;
  const AFileName: String);
begin
  CreateEditor(AFileName, HexParams.WriteProtected);
end;

procedure TMainForm.ShowNumViewer(AEnable: Boolean);
var
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if Assigned(F) then
    F.ShowNumViewer := AEnable
  else
    HexParams.NumViewerVisible := AEnable;
end;

procedure TMainForm.ShowStatusbar(AEnable: boolean);
begin
  HexParams.ShowStatusBar := AEnable;
  AcShowstatusbar.Checked := AEnable;
  ApplyParams(HexParams);
end;

procedure TMainForm.ShowToolbar(AEnable: boolean);
begin
  Toolbar.Visible := AEnable;
  acShowToolbar.Checked := AEnable;
end;

procedure TMainForm.UpdateCaption;
begin
  if Assigned(GetActiveHexEditorFrame) then
    Caption := Format('%s - %s', [PROG_NAME, GetActiveHexEditorFrame.Caption])
  else
    Caption := PROG_NAME;
end;

procedure TMainForm.UpdateCmds;
var
  F: THexEditorFrame;
  i: Integer;
  ac: TAction;
  F_ok: Boolean;
  Hex_ok: Boolean;
begin
  F := GetActiveHExEditorFrame;
  F_ok := (F <> nil);
  Hex_ok := F_ok and (F.HexEditor <> nil);

  acFileClose.Enabled := Hex_ok;
  acFileCloseAll.Enabled := Hex_ok;
  acFileSave.Enabled := Hex_ok;
  acFileSaveAs.Enabled := Hex_ok;

  if (F = nil) then
  begin
    if (not HexParams.ViewOnly) and HexParams.AllowInsertMode then
      acEditInsertMode.Enabled := true
    else
      acEditOverwriteMode.Enabled := true;
  end
  else if Assigned(F.HexEditor) then
  begin
    if F.HexEditor.InsertMode then
      acEditInsertMode.Checked := true
    else
      acEditOverwriteMode.Checked := true;
    if (not F.HexEditor.ReadOnlyView) and F.HexEditor.AllowInsertMode then
      acEditInsertMode.Enabled := true
    else
      acEditOverwriteMode.Enabled := true;
  end;
  acEditOverWriteMode.Enabled := acEditInsertMode.Enabled;

  for i := 0 to ActionList.ActionCount-1 do begin
    ac := TAction(ActionList[i]);
    if InRange(ac.tag, TAG_SET_BOOKMARK, TAG_SET_BOOKMARK + 10) then
      ac.Enabled := Hex_ok;
    if InRange(ac.Tag, TAG_GOTO_BOOKMARK, TAG_GOTO_BOOKMARK + 10) then
      ac.Enabled := Hex_ok and (F.HexEditor.Bookmark[ac.Tag - TAG_GOTO_BOOKMARK].mPosition <> -1);
    if InRange(ac.Tag, TAG_CLEAR_BOOKMARK, TAG_CLEAR_BOOKMARK + 10) then
      ac.Enabled := Hex_ok and (F.HexEditor.Bookmark[ac.Tag - TAG_CLEAR_BOOKMARK].mPosition <> -1);
  end;
end;

procedure TMainForm.WriteIni;
var
  ini : TCustomIniFile;
  F: THexEditorFrame;
begin
  F := GetActiveHexEditorFrame;
  if F <> nil then
    F.ActiveParams(HexParams);

  ini := CreateIniFile;
  try
    WriteFormToIni(ini, self, 'MainForm');
    ini.WriteBool('MainForm', 'ShowToolbar', acShowToolbar.Checked);
    ini.WriteBool('MainForm', 'ShowStatusbar', acShowStatusbar.Checked);
    WriteParamsToIni(ini, 'Params');
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

end.
