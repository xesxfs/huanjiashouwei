package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   
   public class Bullet extends MovieClip
   {
       
      
      protected var isActive:Boolean = true;
      
      protected var target:Enemy;
      
      public var doubleDamage:Boolean;
      
      public var §_-54§:int;
      
      protected var alphaTime:int = 3;
      
      protected var alphaTimeCounter:int = 0;
      
      protected var §_-J7§:int = 10;
      
      protected var §_-Rn§:int = 0;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var aceleration:Number = 20;
      
      protected var minAceleration:Number;
      
      protected var §_-0m§:Number;
      
      protected var §_-KM§:Number;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var §_-NK§:Boolean;
      
      protected var sniperLevel:int;
      
      protected var §_-Ss§:int = 1;
      
      protected var §_-§:int = 0;
      
      protected var §_-D§:Boolean;
      
      protected var §_-Q2§:int;
      
      protected var cRoot:Level;
      
      public function Bullet(param1:Enemy, param2:Point, param3:Boolean, param4:int, param5:Boolean = false, param6:int = 0, param7:Boolean = true, param8:int = 0)
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11);
         this.target = param1;
         this.§_-NK§ = param3;
         this.sniperLevel = param4;
         this.minAceleration = 10;
         this.doubleDamage = param5;
         this.§_-54§ = param6;
         this.visible = false;
         this.§_-D§ = param7;
         this.§_-Q2§ = param8;
         if(param2 != null)
         {
            this.§_-0m§ = param2.x;
            this.§_-KM§ = param2.y;
         }
         else
         {
            this.§_-0m§ = param1.x;
            this.§_-KM§ = param1.y;
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         if(!this.visible)
         {
            this.alphaTimeCounter++;
            if(this.alphaTimeCounter >= this.alphaTime)
            {
               this.visible = true;
            }
         }
         this.moveMe(false);
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "idle" && this.currentFrameLabel != "hitEnd")
         {
            this.play();
         }
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         if(!this.§_-NK§)
         {
            this.cRoot.game.gameSounds.§_-3o§();
         }
         else
         {
            this.cRoot.game.gameSounds.§_-N7§();
         }
         if(this.§_-D§)
         {
            this.cRoot.bullets.addChild(new TowerArcherMusketeerSmoke(new Point(this.x,this.y),new Point(this.§_-0m§,this.§_-KM§)));
         }
         if(this.§_-Q2§ == 0)
         {
            this.minDamage = this.cRoot.gameSettings.archers.musketeer.minDamage;
            this.maxDamage = this.cRoot.gameSettings.archers.musketeer.maxDamage;
         }
         else
         {
            this.minDamage = this.§_-Q2§;
            this.maxDamage = this.§_-Q2§;
         }
      }
      
      protected function moveMe(param1:Boolean) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this.target == null || !this.target.isActive)
         {
            _loc2_ = this.§_-KM§ - this.y;
            _loc3_ = this.§_-0m§ - this.x;
         }
         else
         {
            _loc2_ = this.target.y + this.target.yAdjust - this.y;
            _loc3_ = this.target.x + this.target.xAdjust - this.x;
            this.§_-KM§ = this.target.y + this.target.yAdjust;
            this.§_-0m§ = this.target.x + this.target.xAdjust;
         }
         _loc4_ = Math.atan2(_loc2_,_loc3_);
         this.§_-IR§ = Math.sin(_loc4_) * this.aceleration;
         this.§_-Jy§ = Math.cos(_loc4_) * this.aceleration;
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         if(param1 && this.§_-KM§ <= this.y)
         {
            this.y = this.y - 11;
         }
         if(this.§_-NK§)
         {
            this.§_-§++;
            if(this.§_-Ss§ == this.§_-§)
            {
               if(this.visible)
               {
                  this.cRoot.bulletsDecals.addChild(new TowerArcherMusketeerSniperParticle(new Point(this.x,this.y),this.rotation));
               }
               this.§_-§ = 0;
            }
         }
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         if(Math.sqrt(Math.pow(this.§_-KM§ - this.y,2) + Math.pow(this.§_-0m§ - this.x,2)) < this.aceleration)
         {
            if(this.target != null && this.target.isActive)
            {
               this.hitOnTarget();
            }
            else
            {
               this.§_-NM§();
            }
         }
      }
      
      protected function hitOnTarget() : void
      {
         this.hit();
      }
      
      protected function hit() : void
      {
         var _loc1_:Class = null;
         this.isActive = false;
         this.x = this.§_-0m§;
         this.y = this.§_-KM§;
         this.aceleration = 0;
         this.rotation = 260 + Math.random() * 20;
         if(this.target.§_-2y§)
         {
            _loc1_ = getDefinitionByName(this.target.§_-4q§) as Class;
            this.cRoot.bullets.addChild(new _loc1_(new Point(this.x,this.y),this.rotation,this.cRoot));
         }
         if(this.§_-NK§)
         {
            MovieClip(this.target).snipe(this.getDamage(),this.sniperLevel);
         }
         else
         {
            this.target.setDamage(this.getDamage(),this.cRoot.gameSettings.P_ARMOR,null,this.§_-54§);
            if(this.doubleDamage)
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"crit"));
            }
            else if(this.target != null && this.target.isDead)
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"aack"));
            }
         }
         this.destroyThis();
      }
      
      private function §_-NM§() : void
      {
         this.isActive = false;
         this.cRoot.decals.addChild(new BulletSmoke(new Point(this.§_-0m§,this.§_-KM§)));
         this.destroyThis();
      }
      
      protected function getDamage() : int
      {
         var _loc1_:int = this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
         if(this.doubleDamage)
         {
            return _loc1_ * 2;
         }
         return _loc1_;
      }
      
      protected function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}
