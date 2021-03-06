function label = data_label(filename, dataLines)
%IMPORTFILE Import data from a text file
%  ABALONE = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a string array.
%
%  ABALONE = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  abalone = importfile("C:\Users\lukeg\Desktop\numerical project\abalone.data", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 03-May-2020 23:08:10

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 9);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["M", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9"];
opts.SelectedVariableNames = "M";
opts.VariableTypes = ["string", "string", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["M", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["M", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9"], "EmptyFieldRule", "auto");

% Import the data
label = readmatrix(filename, opts);

end