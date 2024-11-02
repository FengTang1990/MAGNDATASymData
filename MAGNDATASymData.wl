(* ::Package:: *)

BeginPackage["MAGNDATASymData`"];


dir::usage="specify the directory of source data: MAGNDATASymData.mx."
diff::usage=" "
idUtypemsg::usage=" "
data::usage=" "
id::usage=" "
n1::usage=" "
Us::usage=" "
UU::usage=" "
tmp::usage=" "
tmptmp::usage=" "
ii::usage=" "
\[Delta]\[Nu]::usage=" "
formula::usage=" "


Begin["`Private`"];


dir=Input["Please input the directory of MAGNDATASymdata.mx:"];
{diff,idUtypemsg,data}=Import[dir<>"\\MAGNDATASymData.mx"];
id="0.45";


Print[Grid[{{"Select ID+Chemical formula in MAGNDATA: "},{PopupMenu[Dynamic[{id,formula}],diff]},
{Dynamic["U-type: "<>idUtypemsg[[Position[idUtypemsg\[Transpose][[1]],id][[1,1]],2]]]},
{Dynamic[n1=Position[data,id];"Magnetic space group: "<>idUtypemsg[[Position[idUtypemsg\[Transpose][[1]],id][[1,1]],3]]]},
{Dynamic[Us=data[[n1\[Transpose][[1]]]]\[Transpose][[1]]\[Transpose][[3]];
"Select value of U (eV):"]},
{Dynamic[PopupMenu[Dynamic[UU],Us]]},
{Dynamic[tmp=data[[n1\[Transpose][[1]]]][[Position[Us,UU][[1,1]]]][[2]];
"Select variation of filling with respect to the intrinsic filling:"]},
{PopupMenu[Dynamic[\[Delta]\[Nu]],Range[9]-5]},
{Dynamic[tmptmp=tmp[[\[Delta]\[Nu]+5]];
ToString[Length[tmptmp]]<>" possible sets of high-symmetry point symmetry-data, and choose one:"]},
{Dynamic[PopupMenu[Dynamic[ii],Range[Length[tmptmp]]]]},
{Dynamic[Grid[tmptmp[[ii]],Frame->All]]},
{"Raw data: "},
{Dynamic[tmptmp[[ii]]]}},Frame->All,Alignment->Center,Background->{None,{{LightOrange,White,LightOrange,White,LightOrange,White,LightOrange,White}}},FrameStyle->Directive[Thick,Purple]]]


End[];


EndPackage[];
