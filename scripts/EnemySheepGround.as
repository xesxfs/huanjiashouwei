package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EnemySheepGround extends EnemySheep
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemySheepGround(param1:int, param2:Array, param3:Number, param4:Number, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Number)
      {
         addFrameScript(8,this.frame9,16,this.frame17,24,this.frame25,43,this.frame44,47,this.frame48,59,this.frame60,70,this.frame71);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.xAdjust = 0;
         this.yAdjust = -5;
         this.§_-NA§ = 10;
         this.§_-C-§ = 18;
         this.lifebarPosition = new Point(0,-20);
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyExploteSound();
      }
      
      function frame9() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame17() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame25() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame44() : *
      {
         stop();
      }
      
      function frame48() : *
      {
         stop();
      }
      
      function frame60() : *
      {
         stop();
      }
      
      function frame71() : *
      {
         stop();
      }
   }
}
