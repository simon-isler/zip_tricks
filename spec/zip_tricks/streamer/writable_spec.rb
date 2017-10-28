require_relative '../../spec_helper'

describe ZipTricks::Streamer::Writable do
  describe '#<<' do
    it 'writes the given data to the destination and returns self' do
      buf = StringIO.new
      subject = described_class.new(double('streamer'), buf)

      result = subject << 'hello!'

      expect(buf.string).to eq('hello!')
      expect(result).to eq(subject)
    end
    
    it 'raises if the write is attempted after closing'
  end

  describe '#close' do
    it 'finishes the writer and writes data descriptor on the Streamer'
    it 'does not write the data descriptor twice'
  end

  describe '#write' do
    it 'writes the given data to the destination and returns the number of bytes written' do
      buf = StringIO.new
      subject = described_class.new(double('streamer'), buf)

      result = subject.write('hello!')

      expect(buf.string).to eq('hello!')
      expect(result).to eq(6)
    end
  end
end
