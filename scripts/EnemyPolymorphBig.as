package
{
   import flash.geom.Point;
   
   public class EnemyPolymorphBig extends EnemyPolymorph
   {
       
      
      public function EnemyPolymorphBig(param1:Point, param2:Level, param3:Enemy)
      {
         addFrameScript(11,this.frame12);
         super(param1,param2,param3);
      }
      
      function frame12() : *
      {
         stop();
      }
   }
}
