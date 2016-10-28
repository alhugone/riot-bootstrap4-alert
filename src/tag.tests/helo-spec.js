describe('Simple test', function() {

  before(function() {
    var html = document.createElement('alerts')
    document.body.appendChild(html)
    tag = riot.mount('alerts')[0]
  });

  it('mounts a hello tag', function() {
    expect(tag).to.exist
    expect(tag.isMounted).to.be.true
  })

  it('after mount tag has no elements', function() {
    expect(tag.root.children.length).to.be.eq(0);
  })

  it('after addAlert create DOM child', function() {
    tag = riot.mount('alerts')[0]
    tag.addAlert({type:'info',msg:'msg'});
    expect(tag.root.children.length).to.be.eq(1);
    expect(tag.alerts.length).to.be.eq(1);
  })
})
