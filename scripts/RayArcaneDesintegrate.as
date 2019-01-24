package
{
   import flash.geom.Point;
   
   public class RayArcaneDesintegrate extends RayArcane
   {
       
      
      private var §var§:Boolean;
      
      public function RayArcaneDesintegrate(param1:Point, param2:Enemy)
      {
         addFrameScript(9,this.frame10);
         super(param1,param2,true);
      }
      
      function frame10() : *
      {
         stop();
      }
   }
}
