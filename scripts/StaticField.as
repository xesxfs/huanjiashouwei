package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import org.casalib.math.geom.Ellipse;
   
   public class StaticField extends MovieClip
   {
       
      
      private var level:int;
      
      private var initPoint:Point;
      
      private var particles:Dictionary;
      
      private var §_-69§:Number;
      
      private var §_-C7§:Number;
      
      private var §_-F§:int;
      
      private var §_-Tx§:int;
      
      private var displayRangeRelation:Number;
      
      private var §_-K1§:Ellipse;
      
      private var §_-JK§:Ellipse;
      
      private var minDamage:int;
      
      private var maxDamage:int;
      
      private var speed:int;
      
      private var cRoot:Level;
      
      public function StaticField(param1:int, param2:Point)
      {
         super();
         this.level = param1;
         this.initPoint = param2;
         this.particles = new Dictionary();
         this.speed = 15;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.minDamage = this.cRoot.gameSettings.engineers.tesla.overchargeMinDamage + this.cRoot.gameSettings.engineers.tesla.overchargeDamageIncrement * this.level;
         this.maxDamage = this.cRoot.gameSettings.engineers.tesla.overchargeMaxDamage + this.cRoot.gameSettings.engineers.tesla.overchargeDamageIncrement * this.level;
         this.§_-Tx§ = this.cRoot.gameSettings.engineers.tesla.overchargeArea;
         this.§_-F§ = this.cRoot.gameSettings.engineers.tesla.overchargeArea * this.cRoot.gameSettings.rangeRatio;
         this.displayRangeRelation = this.cRoot.gameSettings.engineers.tesla.overchargeDisplayRatio;
         this.§_-K1§ = new Ellipse(this.initPoint.x - this.§_-Tx§ / 2 * this.displayRangeRelation,this.initPoint.y - 10 - this.§_-F§ / 2 * this.displayRangeRelation,this.§_-Tx§ * this.displayRangeRelation,this.§_-F§ * this.displayRangeRelation);
         this.§_-69§ = 0;
         this.§_-C7§ = 0;
         this.createParticles();
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-C7§ = this.§_-C7§ + this.speed;
         this.§_-69§ = this.§_-69§ + this.speed * this.cRoot.gameSettings.rangeRatio;
         if(this.§_-C7§ >= this.§_-Tx§)
         {
            this.electrifyEnemies();
            this.destroyThis();
         }
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      protected function createParticles() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ <= 360)
         {
            this.§_-A8§(new StaticFieldParticle(this.initPoint,this.getDestinationPoint(_loc1_)));
            _loc1_ = _loc1_ + 30;
         }
      }
      
      protected function electrifyEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.onRange(_loc1_))
            {
               MovieClip(_loc1_).overcharge(this.getDamage());
            }
         }
      }
      
      private function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      protected function onRange(param1:Enemy) : Boolean
      {
         this.§_-JK§ = new Ellipse(this.initPoint.x - this.§_-C7§ / 2,this.initPoint.y - 10 - this.§_-69§ / 2,this.§_-C7§,this.§_-69§);
         return this.§_-JK§.containsPoint(new Point(param1.x + param1.xAdjust,param1.y + param1.yAdjust));
      }
      
      protected function getDestinationPoint(param1:int) : Point
      {
         return this.§_-K1§.getPointOfDegree(param1);
      }
      
      protected function §_-A8§(param1:StaticFieldParticle) : void
      {
         this.cRoot.decals.addChild(param1);
      }
      
      protected function destroyThis() : void
      {
         this.particles = null;
         this.cRoot = null;
         this.§_-K1§ = null;
         this.§_-JK§ = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
