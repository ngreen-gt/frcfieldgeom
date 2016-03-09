ZoneFun <- function(center=c(0,0), inner_radius=1,outer_radius=2, npoints=100, start=0, end=2)
{
  tt_fwd <- seq(start*pi, end*pi, length.out=npoints)
  tt_rev <- seq(end*pi,start*pi,length.out=npoints)
  zone_fwd <- data.frame(x = center[1] + inner_radius * cos(tt_fwd), 
             y = center[2] + inner_radius * sin(tt_fwd))
  zone_rev <- data.frame(x = center[1] + outer_radius * cos(tt_rev), 
                         y = center[2] + outer_radius * sin(tt_rev))
  rbind(zone_fwd,zone_rev)
}


robotFun <- function(position=c(0,0),width=1,length=1,angle=0)
{
  rad<-angle*pi/180
  pos1 <- data.frame(x=position[1],y=position[2])
  pos2 <- data.frame(x=position[1]+length*cos(rad),y=position[2]+length*sin(rad))
  pos3 <- data.frame(x=position[1]+length*cos(rad)+width*cos(rad-(pi/2)),
                     y=position[2]+length*sin(rad)+width*sin(rad-(pi/2)))
  pos4 <- data.frame(x=position[1]+width*cos(rad-(pi/2)),
                     y=position[2]+width*sin(rad-(pi/2)))
  
  rbind(pos1,pos2,pos3,pos4)
}