/*
 * Copyright (c) 2018 Jeremy Meltingtallow
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

package pongo.ecs;

import pongo.ecs.Entity;
import pongo.util.Disposable;
import pongo.ecs.ds.RuleSet;
import pongo.ecs.ds.EntityMap;

@:final class Manager implements Disposable
{
    /**
     * [Description]
     */
    @:allow(pongo.ecs.Engine)
    private function new() : Void
    {
        _keys = new Array();
        _groups = new Map<String, GroupedEntity>();
        _entityMap = new EntityMap();
    }

    /**
     * [Description]
     * @return Entity
     */
    public function createEntity() : Entity
    {
        return new Entity(this);
    }

    /**
     * [Description]
     */
    public function dispose() : Void
    {
        while(_keys.length > 0) {
            var key = _keys.pop();
            destroyGroup(key);
        }
    }

    @:allow(pongo.ecs.Entity)
    private function notifyAddComponent(entity :Entity, component :Component) : Void
    {
        for(key in _keys) {
            var rules = _groups.get(key).rules;
            if(rules.exists(component.componentName)) {
                var group = _groups.get(key);
                if(!group.exists(entity) && hasAllRules(entity, rules)) {
                    group.addEntity(entity);
                }
            }
        }
        _entityMap.addComponent(entity, component);
    }

    @:allow(pongo.ecs.Entity)
    private function notifyRemoveComponent(entity :Entity, name :String) : Void
    {
        for(key in _keys) {
            var rules = _groups.get(key).rules;
            if(rules.exists(name)) {
                var group = _groups.get(key);
                if(group.exists(entity) && hasAllRules(entity, rules)) {
                    group.removeEntity(entity);
                }
            }
        }
        _entityMap.removeComponent(entity, name);
    }

    @:allow(pongo.ecs.Entity)
    private function notifyAddEntity(entity :Entity) : Void
    {
        for(key in _keys) {
            var rules = _groups.get(key).rules;
            var group = _groups.get(key);
            if(!group.exists(entity) && hasAllRules(entity, rules)) {
                group.addEntity(entity);
            }
        }
    }

    @:allow(pongo.ecs.Entity)
    private function notifyRemoveEntity(entity :Entity) : Void
    {
        for(key in _keys) {
            var rules = _groups.get(key).rules;
            var group = _groups.get(key);
            if(group.exists(entity) && hasAllRules(entity, rules)) {
                group.removeEntity(entity);
            }
        }
    }

    @:allow(pongo.ecs.Engine)
    private function createGroup(name :String, classNames :Array<String>) : GroupedEntity
    {
        if(!_groups.exists(name)) {
            _groups.set(name, new GroupedEntity(RuleSet.fromArray(classNames)));
            _keys.push(name);
        }
        return _groups.get(name);
    }

    @:allow(pongo.ecs.Engine)
    private inline function getGroup(name :String) : GroupedEntity
    {
        return _groups.get(name);
    }

    @:allow(pongo.ecs.Engine)
    private function destroyGroup(name :String) : Void
    {
        if(_groups.exists(name)) {
            _groups.remove(name);
            _keys.remove(name);
        }
    }

    private function hasAllRules(entity :Entity, rules :RuleSet) : Bool
    {
        for(rule in rules) {
            if(!_entityMap.hasComponent(entity, rule)) {
                return false;
            }
        }
        return true;
    }

    private var _keys :Array<String>;
    private var _groups :Map<String, GroupedEntity>;
    @:allow(pongo.ecs.Entity) private var _entityMap :EntityMap;
}