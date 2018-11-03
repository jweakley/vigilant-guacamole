import Ember from 'ember';
import { ActiveModelSerializer } from 'active-model-adapter';

export function getHasManyPayloadKey(key) {
  const singularKey = Ember.Inflector.inflector.singularize(key);
  return `${singularKey}_ids`;
}

export default ActiveModelSerializer.extend({
  attrs: {
    createdAt: { serialize: false },
    updatedAt: { serialize: false }
  },

  _getHasManyPayloadKey(key) {
    return getHasManyPayloadKey(key);
  },

  serializeHasMany(snapshot, json, relationship) {
    const key = relationship.key;

    json[this._getHasManyPayloadKey(key)] = snapshot.hasMany(
      key, { ids: true }
    );
  },
});
