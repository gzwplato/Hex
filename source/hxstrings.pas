unit hxStrings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

resourcestring
  // hxMain
  SNoName = 'Untitled%d';

  // hxEditFrame
  SWriteProtectedCaption ='%s [read-only]';
  SEmptyCaption = 'Hex-Editor (empty)';
  SReadOnlyFile = 'File %s is write-protected. It only can be saved with a different name.';
  SErrorSavingFile = 'An error has occured with saving file "%s".';
  SCloseModified = 'File has been modified. Do you want to save before closing?';
  SMaskSize = 'Size: %s Bytes';
  SMaskPos = 'Pos: %s';

  // hxGotoForm
  SNoValidNumber = '"%s" is not a valid number.';
  SGotoPastBOF = 'This jump will reach beyond the begin of file. Jump to begin of file?';
  SGotoPastEOF = 'This jump will reach beyond the end of file. Jump to end of file?';

implementation

end.
