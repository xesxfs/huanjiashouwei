package com.reintroducing.sound
{
   import com.greensock.TweenLite;
   import com.greensock.plugins.TweenPlugin;
   import com.greensock.plugins.VolumePlugin;
   import com.reintroducing.events.SoundManagerEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.getQualifiedClassName;
   
   public class SoundItem extends EventDispatcher
   {
       
      
      private var _fadeTween:TweenLite;
      
      private var _volume:Number;
      
      public var name:String;
      
      public var sound:Sound;
      
      public var channel:SoundChannel;
      
      public var position:int;
      
      public var paused:Boolean;
      
      public var savedVolume:Number;
      
      public var startTime:Number;
      
      public var loops:int;
      
      public var pausedByAll:Boolean;
      
      public var muted:Boolean;
      
      public function SoundItem()
      {
         super();
         TweenPlugin.activate([VolumePlugin]);
         this.init();
      }
      
      private function init() : void
      {
         this.channel = new SoundChannel();
      }
      
      private function fadeComplete(param1:Boolean) : void
      {
         if(param1)
         {
            this.stop();
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_FADE_COMPLETE,this));
      }
      
      public function play(param1:Number = 0, param2:int = 0, param3:Number = 1, param4:Boolean = true) : void
      {
         var $startTime:Number = param1;
         var $loops:int = param2;
         var $volume:Number = param3;
         var $resumeTween:Boolean = param4;
         if(!this.paused)
         {
            return;
         }
         this.volume = $volume;
         this.savedVolume = this.volume;
         this.startTime = $startTime;
         this.loops = $loops;
         this.paused = $startTime == 0?true:false;
         if(!this.paused)
         {
            this.position = this.startTime;
         }
         if(this.channel != null)
         {
            try
            {
               this.channel = this.sound.play(this.position,this.loops,new SoundTransform(this.volume));
               this.channel.addEventListener(Event.SOUND_COMPLETE,this.handleSoundComplete,false,0,true);
            }
            catch(err:Error)
            {
            }
         }
         this.paused = false;
         if($resumeTween && this.fadeTween != null)
         {
            this.fadeTween.resume();
         }
      }
      
      public function pause(param1:Boolean = true) : void
      {
         this.paused = true;
         if(this.channel != null)
         {
            this.position = this.channel.position;
            this.channel.stop();
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.handleSoundComplete);
         }
         if(param1 && this.fadeTween != null)
         {
            this.fadeTween.pause();
         }
      }
      
      public function stop() : void
      {
         this.paused = true;
         if(this.channel != null)
         {
            this.channel.stop();
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.handleSoundComplete);
            this.position = this.channel.position;
         }
         this.fadeTween = null;
      }
      
      public function fade(param1:Number = 0, param2:Number = 1, param3:Boolean = false) : void
      {
         this.fadeTween = TweenLite.to(this.channel,param2,{
            "volume":param1,
            "onComplete":this.fadeComplete,
            "onCompleteParams":[param3]
         });
      }
      
      public function setVolume(param1:Number) : void
      {
         var _loc2_:SoundTransform = null;
         if(this.channel != null)
         {
            _loc2_ = this.channel.soundTransform;
            _loc2_.volume = param1;
            this.channel.soundTransform = _loc2_;
         }
         this._volume = param1;
      }
      
      public function destroy() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.handleSoundComplete);
            this.channel = null;
         }
         this.fadeTween = null;
         this.sound = null;
      }
      
      private function handleSoundComplete(param1:Event) : void
      {
         this.stop();
      }
      
      public function get volume() : Number
      {
         if(this.channel == null)
         {
            return 0;
         }
         return this.channel.soundTransform.volume;
      }
      
      public function set volume(param1:Number) : void
      {
         this.setVolume(param1);
      }
      
      public function get fadeTween() : TweenLite
      {
         return this._fadeTween;
      }
      
      public function set fadeTween(param1:TweenLite) : void
      {
         if(param1 == null)
         {
            TweenLite.killTweensOf(this);
         }
         this._fadeTween = param1;
      }
      
      override public function toString() : String
      {
         return getQualifiedClassName(this);
      }
   }
}
