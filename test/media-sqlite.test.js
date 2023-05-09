const cds = require('@sap/cds/lib')

describe('cap/samples - Media Handling with SQLite', () => {
  const { GET, POST, PUT, expect, axios } = cds.test('@capire/media-sqlite')
  axios.defaults.auth = { username: 'admin', password: '' }
  const guid = '89446b04-5ae2-4f2e-ad39-5ecec9120e74'

  it('serves $metadata documents in v4', async () => {
    const { headers, status, data } = await GET`/media-server/$metadata`
    expect(status).to.equal(200)
    expect(headers).to.contain({
      'content-type': 'application/xml',
      'odata-version': '4.0',
    })
    expect(data).to.contain(
      '<EntitySet Name="Media" EntityType="sap.capire.media.MediaServer.Media"/>'
    )
  })

  it('serves Media empty', async () => {
    const { data } = await GET`/media-server/Media`
    expect(data.value).to.containSubset([])
  })

  it('accepts creation of Media', async () => {
    const { status, data } = await POST`/media-server/Media ${{
      ID: guid,
      mediaType: 'image/png',
      fileName: 'Test.png',
    }}`
    expect(status).to.equal(201)
    /*
    expect(data.value).to.containSubset({
      '@odata.context': '$metadata#Media/$entity',
      ID: '89446b04-5ae2-4f2e-ad39-5ecec9120e74',
      createdBy: 'admin',
      modifiedBy: 'admin',
      'content@odata.mediaContentType': 'image/png',
      mediaType: 'image/png',
      fileName: 'Test.png',
      applicationName: null,
    })
    */
  })

  it.todo('accepts upload of Media')

  it.todo('serves Media for download')

  it.todo('serves deletion of Media')
})
