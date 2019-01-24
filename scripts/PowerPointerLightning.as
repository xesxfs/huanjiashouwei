package
{
   import com.dougmccune.HitTester;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class PowerPointerLightning extends §_-Tm§
   {
       
      
      public var hitAreaMe:MovieClip;
      
      private var target:Enemy;
      
      public function PowerPointerLightning(param1:Level, param2:§_-5g§)
      {
         addFrameScript(0,this.frame1);
         super(param1,param2);
         this.cRoot.setPowerPointer(this);
      }
      
      override public function canFirePower() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_ != null && _loc2_.isActive && HitTester.realHitTest(_loc2_,new Point(this.x,this.y),this.cRoot))
            {
               if(_loc1_ == null || _loc1_.y < _loc2_.y)
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.target = _loc1_;
            return true;
         }
         return false;
      }
      
      override public function createPower() : void
      {
         this.cRoot.bullets.addChild(new SpecialLightning(new Point(this.x,this.y),this.cRoot,this.target));
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
