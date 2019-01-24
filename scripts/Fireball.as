package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class Fireball extends MovieClip
   {
       
      
      protected var §_-O2§:§_-8O§;
      
      protected var isActive:Boolean = true;
      
      protected var §_-96§:Ellipse;
      
      private var durationTime:int = 75;
      
      private var durationTimeCounter:int = 0;
      
      protected var §_-J7§:int = 30;
      
      protected var §_-Rn§:int = 0;
      
      private var initDamage:int = 5;
      
      private var §_-RP§:int = 5;
      
      private var §_-89§:int = 0;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var maxAceleration:Number = 15;
      
      protected var aceleration:Number = 10;
      
      protected var §_-Cv§:Point;
      
      protected var sName:String;
      
      protected var §_-JU§:String;
      
      private var damage:int;
      
      public var cRoot:Level;
      
      public function Fireball(param1:Point, param2:Point)
      {
         super();
         addFrameScript(5,this.frame6,24,this.frame25);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-Cv§ = param2;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.sName = "fireball" + Math.random().toString();
         SoundManager.getInstance().addLibrarySound(§_-Rz§,this.sName);
         SoundManager.getInstance().playSound(this.sName,0.15,0,0);
         this.§_-9k§();
         this.§_-O2§ = new §_-8O§(this.§_-Cv§);
         this.cRoot.decals.addChild(this.§_-O2§);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         this.§_-Sy§();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "travelEnd":
               this.gotoAndPlay("travel");
               break;
            case "hitEnd":
               break;
            default:
               this.play();
         }
      }
      
      protected function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      private function §_-Sy§() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         _loc1_ = this.§_-Cv§.y - this.y;
         _loc2_ = this.§_-Cv§.x - this.x;
         _loc3_ = Math.atan2(_loc1_,_loc2_);
         if(this.aceleration < this.maxAceleration)
         {
            this.aceleration = this.aceleration + Math.ceil(this.aceleration * 0.05);
            if(this.aceleration >= this.maxAceleration)
            {
               this.aceleration = this.maxAceleration;
            }
         }
         this.§_-IR§ = Math.sin(_loc3_) * this.aceleration;
         this.§_-Jy§ = Math.cos(_loc3_) * this.aceleration;
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         this.freeParticles();
         if(Math.sqrt(Math.pow(this.§_-Cv§.y - this.y,2) + Math.pow(this.§_-Cv§.x - this.x,2)) < this.aceleration)
         {
            this.hit();
         }
      }
      
      protected function hit() : void
      {
         SoundManager.getInstance().stopSound(this.sName);
         SoundManager.getInstance().removeSound(this.sName);
         this.§_-JU§ = "fireball_hit_" + Math.random().toString();
         SoundManager.getInstance().addLibrarySound(§_-Ht§,this.§_-JU§);
         SoundManager.getInstance().playSound(this.§_-JU§,0.15,0,0);
         this.isActive = false;
         this.aceleration = 0;
         this.rotation = 0;
         this.§_-O2§.destroyThis();
         this.§_-O2§ = null;
         this.cRoot.addToDecal(new Decal(this.x,this.y,"crater",180,Math.random() / 2 + 1));
         this.gotoAndPlay("hit");
         this.damageEnemies();
         this.damageStaticEnemies();
         this.freeScorchedEarth();
      }
      
      private function freeScorchedEarth() : void
      {
         if(this.cRoot.game.gameUpgrades.rainUpScorchedEarth && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 2))
         {
            this.cRoot.decals.addChild(new ScorchedEarth(new Point(this.x,this.y),this.cRoot));
         }
      }
      
      private function freeParticles() : void
      {
         this.§_-A8§(new Point(this.x,this.y - 10));
         this.§_-A8§(new Point(this.x + this.§_-Jy§ / 2,this.y + this.§_-IR§ / 2 - 10));
      }
      
      protected function §_-A8§(param1:Point) : void
      {
         var _loc3_:FireballParticle = null;
         var _loc2_:FireballParticle = null;
         for each(_loc3_ in this.cRoot.game.main.fireballParticlesPool)
         {
            if(!_loc3_.isActive)
            {
               _loc3_.§_-Rt§(param1,this.cRoot.bulletsDecals);
               return;
            }
            if(_loc2_ == null || _loc2_.§_-My§ < _loc3_.§_-My§)
            {
               _loc2_ = _loc3_;
            }
         }
         _loc2_.§_-Rt§(param1,this.cRoot.bulletsDecals);
      }
      
      public function damageEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.onRange(_loc1_))
            {
               _loc1_.setDamage(this.damage);
               if(_loc1_ != null && _loc1_.isDead)
               {
                  this.cRoot.game.gameAchievement.§_-MC§(this.cRoot);
               }
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
               _loc1_.setDamage(this.damage);
               if(_loc1_ != null && _loc1_.isDead)
               {
                  this.cRoot.game.gameAchievement.§_-MC§(this.cRoot);
               }
            }
         }
      }
      
      public function onRange(param1:Enemy) : Boolean
      {
         return this.§_-96§.containsPoint(new Point(param1.x + param1.xAdjust,param1.y + param1.yAdjust));
      }
      
      private function §_-9k§() : void
      {
         this.§_-96§ = new Ellipse(this.§_-Cv§.x - this.cRoot.gameSettings.powers.fireball.range / 2,this.§_-Cv§.y - this.cRoot.gameSettings.powers.fireball.range * this.cRoot.gameSettings.rangeRatio / 2,this.cRoot.gameSettings.powers.fireball.range,this.cRoot.gameSettings.powers.fireball.range * this.cRoot.gameSettings.rangeRatio);
         this.damage = this.cRoot.gameSettings.powers.fireball.minDamage + Math.ceil(Math.random() * (this.cRoot.gameSettings.powers.fireball.maxDamage - this.cRoot.gameSettings.powers.fireball.minDamage));
      }
      
      public function destroyThis() : void
      {
         this.§_-96§ = null;
         this.cRoot = null;
         this.§_-O2§ = null;
         SoundManager.getInstance().removeSound(this.§_-JU§);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame6() : *
      {
         gotoAndPlay("travel");
      }
      
      function frame25() : *
      {
         stop();
      }
   }
}
