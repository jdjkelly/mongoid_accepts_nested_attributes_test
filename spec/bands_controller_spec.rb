require 'rails_helper'

RSpec.describe BandsController, type: :controller do
  let(:band) { Band.create({name: "the sucks"}) }
  let(:instrument) { Instrument.create({name: "guitar"}) }

  it "adds new instrument to the band" do
    expect {
      put :update, { id: band.id, band: { instruments_attributes: [{ name: "drums" }] } }
      band.reload
    }.to change {band.instruments.count}.by(1)
  end

  it "adds existing instrument to the band, using id" do
    expect {
      put :update, { id: band.id, band: { instruments_attributes: [{ id: instrument.id, name: "guitar" }] } }
      band.reload
    }.to change {band.instruments.count}.by(1)
  end

  it "adds existing instrument to the band, using _id" do
    expect {
      put :update, { id: band.id, band: { instruments_attributes: [{ _id: instrument.id, name: "guitar" }] } }
      band.reload
    }.to change {band.instruments.count}.by(1)
  end

end
