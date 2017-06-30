function [ opLBPu, opHara, opHoG, opGabor ] = fx_params( fx )
%FX_EXTRACTION_PARAMS Summary of this function goes here
%   Detailed explanation goes here

  opLBPu.vdiv = fx.vdiv;
  opLBPu.hdiv = fx.hdiv;
  opLBPu.semantic = 0;
  opLBPu.samples = 8;
  opLBPu.mappingtype = 'u2';

  opHara.dharalick = fx.dhar;
  
  opGabor.Lgabor  = 5;                 % number of rotations
  opGabor.Sgabor  = 5;                 % number of dilations (scale)
  opGabor.fhgabor = 1.75;                 % highest frequency of interest
  opGabor.flgabor = 0.25;               % lowest frequency of interest
  opGabor.Mgabor  = 20;                % mask size
  opGabor.show    = 0; 

  opHoG.nj    = 5;             % 10 x 20 
  opHoG.ni    = 5;             % histograms
  opHoG.B     = 3;              % 9 bins
  opHoG.show  = 0;              % show results

end

