/*
 * Copyright (c) 2017 Cream Engine
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package cream;

import cream.display.Graphics;
import cream.util.Disposable;
import cream.scene.Scene;

@:final class Origin<Msg:EnumValue, Model> implements Disposable
{
    public var scene (default, null):Scene<Msg, Model>;
    public var width (get, null) :Int;
    public var height (get, null) :Int;

    public function new(model :Model, init :Msg, fnUpdate : Msg -> Origin<Msg, Model> -> Scene<Msg, Model> -> Model -> Void)  :Void
    {
        _model = model;
        _fnUpdate = fnUpdate;
        this.scene = new Scene(_model, this, init, _fnUpdate);
        
        kha.System.notifyOnRender(renderSprites);
        _schedulerID = kha.Scheduler.addTimeTask(runScene, 0, 1/60);
    }

    public function changeScene(init :Msg) : Void
    {
        var oldScene = this.scene;
        this.scene = new Scene(_model, this, init, _fnUpdate);
        oldScene.dispose();
    }

    public function dispose() : Void
    {
        scene.dispose();
        kha.Scheduler.removeTimeTask(_schedulerID);
    }

    private function runScene() : Void
    {
        scene.runMsgs();
    }

    private function renderSprites(framebuffer: kha.Framebuffer) : Void 
    {
        if(_graphics == null) {
            _graphics = new Graphics(framebuffer);
        }

        _graphics.begin();
        scene.render(_graphics);
        _graphics.end();
    }

    private function get_width() : Int
    {
        return kha.System.windowWidth();
    }

    private function get_height() : Int
    {
        return kha.System.windowHeight();
    }

    private var _model :Model;
    private var _fnUpdate :Msg -> Origin<Msg, Model> -> Scene<Msg, Model> -> Model -> Void;
    private var _graphics :Graphics;
    private var _schedulerID :Int;
}