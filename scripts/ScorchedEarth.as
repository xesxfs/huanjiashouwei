package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class ScorchedEarth extends MovieClip
   {
       
      
      private var damage:int;
      
      private var rangeWidth:int;
      
      private var rangeHeight:int;
      
      private var minDamage:int;
      
      private var maxDamage:int;
      
      private var §_-RP§:int;
      
      private var §_-89§:int;
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      private var isActive:Boolean;
      
      private var fadeTime:int = 50;
      
      private var fadeTimeCounter:int = 0;
      
      private var cRoot:Level;
      
      public function ScorchedEarth(param1:Point, param2:Level)
      {
         super();
         this.isActive = true;
         this.x = param1.x;
         this.y = param1.y;
         this.durationTimeCounter = 0;
         this.§_-89§ = 0;
         this.fadeTimeCounter = 0;
         this.cRoot = param2;
         if(this.cRoot.game.gameUpgrades.rainUpBlazingEarth && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 4))
         {
            this.minDamage = this.cRoot.gameSettings.powers.fireball.blazingEarthMinDamage;
            this.maxDamage = this.cRoot.gameSettings.powers.fireball.blazingEarthMaxDamage;
            this.rangeWidth = this.cRoot.gameSettings.powers.fireball.blazingEarthRange;
            this.§_-RP§ = this.cRoot.gameSettings.powers.fireball.blazingEarthDamageTime;
            this.durationTime = this.cRoot.gameSettings.powers.fireball.blazingEarthDuration;
         }
         else
         {
            this.minDamage = this.cRoot.gameSettings.powers.fireball.scorchedEarthMinDamage;
            this.maxDamage = this.cRoot.gameSettings.powers.fireball.scorchedEarthMaxDamage;
            this.rangeWidth = this.cRoot.gameSettings.powers.fireball.scorchedEarthRange;
            this.§_-RP§ = this.cRoot.gameSettings.powers.fireball.scorchedEarthDamageTime;
            this.durationTime = this.cRoot.gameSettings.powers.fireball.scorchedEarthDuration;
         }
         this.getDamage();
         this.rangeHeight = this.rangeWidth * this.cRoot.gameSettings.rangeRatio;
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            if(this.fadeTimeCounter < this.fadeTime)
            {
               this.alpha = this.alpha - 0.03;
               this.fadeTimeCounter++;
            }
            else
            {
               this.destroyThis();
            }
            return;
         }
         this.durationTimeCounter++;
         this.§_-89§++;
         if(this.durationTimeCounter >= this.durationTime)
         {
            this.isActive = false;
            return;
         }
         if(this.§_-89§ >= this.§_-RP§)
         {
            this.damageEnemies();
            this.damageStaticEnemies();
            this.§_-89§ = 0;
         }
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      private function damageEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && !_loc1_.isFlying && this.onRange(_loc1_))
            {
               _loc1_.setDamage(this.damage,this.cRoot.gameSettings.P_ARMOR);
            }
         }
      }
      
      public function damageStaticEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.staticEnemies)
         {
            if(_loc1_.isActive && this.onRange(_loc1_))
            {
               _loc1_.setDamage(this.damage,this.cRoot.gameSettings.P_ARMOR);
            }
         }
      }
      
      protected function getDamage() : void
      {
         this.damage = this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      public function onRange(param1:Object) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeWidth / 2,this.y - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
   }
}
