package
{
   import flash.geom.Point;
   
   public class PowerPointerFireball extends §_-Tm§
   {
       
      
      public function PowerPointerFireball(param1:Level, param2:§_-5g§)
      {
         super(param1,param2);
         this.cRoot.setPowerPointer(this);
      }
      
      override public function createPower() : void
      {
         this.cRoot.bullets.addChild(new FireballControler(this.cRoot,new Point(this.x,this.y + 20)));
      }
   }
}
