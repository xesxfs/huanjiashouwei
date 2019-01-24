package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-Hz§ extends MovieClip
   {
       
      
      var §_-9a§:int;
      
      var §_-RY§:int;
      
      var §_-DU§:int;
      
      var §_-Kn§:int;
      
      var §_-1a§:int;
      
      var §_-Cy§:int;
      
      var minDamage:int;
      
      var maxDamage:int;
      
      var rangeWidth:int;
      
      var rangeHeight:int;
      
      var delayTime:int;
      
      var delayTimeCounter:int;
      
      var cRoot:Level;
      
      public function §_-Hz§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Level)
      {
         super();
         this.§_-9a§ = param1;
         this.§_-RY§ = param2;
         this.§_-DU§ = param3;
         this.§_-Cy§ = param4;
         this.minDamage = param5;
         this.maxDamage = param6;
         this.rangeWidth = param7;
         this.rangeHeight = param8;
         this.delayTime = 3;
         this.delayTimeCounter = 0;
         this.§_-Kn§ = 1;
         this.§_-1a§ = this.§_-RY§;
         this.cRoot = param9;
      }
      
      public function onFrameUpdate() : void
      {
         this.delayTimeCounter++;
         if(this.delayTimeCounter < this.delayTime)
         {
            return;
         }
         var _loc1_:Array = this.cRoot.paths[this.§_-9a§];
         var _loc2_:int = this.§_-Kn§ * 4;
         if(this.§_-DU§ + _loc2_ < _loc1_[0].length)
         {
            if(this.§_-Kn§ == 1)
            {
               this.§_-1a§ = this.§_-RY§;
            }
            else if(this.§_-1a§ != this.§_-RY§)
            {
               this.§_-1a§ = this.§_-RY§;
            }
            else if(this.§_-1a§ == 2)
            {
               this.§_-1a§ = 0;
            }
            else if(this.§_-1a§ == 1)
            {
               this.§_-1a§ = 0;
            }
            else if(this.§_-1a§ == 0)
            {
               this.§_-1a§ = 1;
            }
            this.§_-MO§(_loc1_[this.§_-1a§][this.§_-DU§ + _loc2_]);
         }
         if(this.§_-DU§ - _loc2_ > 0)
         {
            this.§_-MO§(_loc1_[this.§_-1a§][this.§_-DU§ - _loc2_]);
         }
         this.§_-Kn§++;
         this.delayTimeCounter = 0;
         if(this.§_-Cy§ < this.§_-Kn§)
         {
            this.destroyThis();
         }
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      protected function §_-MO§(param1:Point) : void
      {
         var _loc2_:Enemy = null;
         this.cRoot.entities.addChild(new §_-Rw§(param1,this.cRoot));
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && this.onRangeFissure(_loc2_,param1))
            {
               _loc2_.setDamage(this.getDamageFissure(),this.cRoot.gameSettings.I_ARMOR,null,0,false);
               if(!_loc2_.isBoss && !_loc2_.isFlying && _loc2_.isActive && !_loc2_.isDead)
               {
                  _loc2_.addDebuff(new §_-SG§(this.cRoot,1,_loc2_));
               }
            }
         }
      }
      
      protected function onRangeFissure(param1:Object, param2:Point) : Boolean
      {
         var _loc3_:* = new Ellipse(param2.x - this.rangeWidth / 2,param2.y - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc3_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function getDamageFissure() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
