function [ opLBPu, opLBPri, opHara ] = fx_params( fx )
%FX_EXTRACTION_PARAMS Summary of this function goes here
%   Detailed explanation goes here

  opLBPu.vdiv = fx.vdiv;
  opLBPu.hdiv = fx.hdiv;
  opLBPu.semantic = 0;
  opLBPu.samples = 8;
  opLBPu.mappingtype = 'u2';
  
  opLBPri.vdiv = fx.vdiv;
  opLBPri.hdiv = fx.hdiv;
  opLBPri.semantic = 0;
  opLBPri.samples = 8;
  opLBPri.mappingtype = 'riu2';
  
  opHara.dharalick = fx.dhar;

end

