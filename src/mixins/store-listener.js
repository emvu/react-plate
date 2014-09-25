StoreListenerMixin = {
  _onChange:function(){
    this.setState(this.getStoreState())
  },

  componentDidMount: function() {
    self = this;
    this.getListeningStores().forEach(function(store) {
      store.addChangeListener(self._onChange);
    })
  },

  componentWillUnmount: function() {
    self = this;
    this.getListeningStores().forEach(function(store) {
      store.removeChangeListener(self._onChange);
    })
  }
};

module.exports = StoreListenerMixin;