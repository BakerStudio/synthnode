var Distortion,types,indexOf=[].indexOf||function(e){for(var l=0,n=this.length;l<n;l++){if(l in this&&this[l]===e)return l}return-1};types=['clip','foldback','random','overflow','zero'];Distortion=(function(){function e(e){var l,n;if(e==null){throw new Error('Required arguments')}if(((l=e.signal)!=null?l.tf:void 0)==null){throw new Error('Required signal (Object with .tf())')}this.signal=e.signal;e.level==null&&(e.level=.5);if(typeof e.level!=='number'){throw new Error('Level must be numeric')}this.level=e.level;e.type==null&&(e.type='clip');if(typeof e.type!=='string'){throw new Error('Type must be a string')}if(n=e.type, indexOf.call(types,n)<0){throw new Error("Type unknown or not supported: "+e.type)}this.type=e.type}e.prototype.tf=function(e){var l,n,r,t,u,v,o,i;n=this.signal;i=this.type;l=function(e){return n.tf(e)};switch(i){case 'clip':if(-this.level<=(r=l(e))&&r<=this.level){return l(e)}else if(l(e)>this.level){return this.level}else{return-this.level};break;case 'foldback':if(-this.level<=(t=l(e))&&t<=this.level){return l(e)}else if(l(e)>this.level){return 2*this.level-l(e)}else{return-2*this.level-l(e)};break;case 'random':if(-this.level<=(u=l(e))&&u<=this.level){return l(e)}else if(l(e)>this.level){return(Math.random()*2-1)*this.level}else{return(Math.random()*2-1)*this.level};break;case 'overflow':if(-this.level<=(v=l(e))&&v<=this.level){return l(e)}else if(l(e)>this.level){return-2*this.level+l(e)}else{return 2*this.level+l(e)};break;case 'zero':if(-this.level<=(o=l(e))&&o<=this.level){return l(e)}else{return 0};break;default:return l(e)}};return e})();module.exports=Distortion