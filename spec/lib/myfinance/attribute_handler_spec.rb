require "spec_helper"

describe Myfinance::AttributeHandler do
  describe ".handle" do
    it "instantiates a new Myfinance::AttributeHandler" do
      expect(Myfinance::AttributeHandler).to receive(:new).and_return(double(handle: ""))
      Myfinance::AttributeHandler.handle("")
    end
  end

  describe "#handle" do
    context "when attribute is a decimal" do
      subject { Myfinance::AttributeHandler.new("1366.99") }

      it "returns a BigDecimal object" do
        expect(subject.handle).to eq(BigDecimal.new("1366.99"))
      end
    end

    context "when attribute is a date in ISO8601 format" do
      subject { Myfinance::AttributeHandler.new("2015-03-26") }

      it "returns a Date object" do
        expect(subject.handle).to eq(Date.new(2015, 3, 26))
      end
    end

    context "when attribute is a datetime in ISO8601 format" do
      context "when datetime has the format with date and hours separated" do
        subject { Myfinance::AttributeHandler.new("2015-03-26 11:11:46") }

        it "returns a Date object" do
          expect(subject.handle).to eq(DateTime.parse("2015-03-26 11:11:46"))
        end
      end

      context "when datetime has the format with date and hours separated, in UTC" do
        subject { Myfinance::AttributeHandler.new("2015-03-26 11:11:46-03:00") }

        it "returns a Date object" do
          expect(subject.handle).to eq(DateTime.parse("2015-03-26 11:11:46-03:00"))
        end
      end

      context "when datetime has the format with date and hours combined, in UTC " do
        subject { Myfinance::AttributeHandler.new("2014-06-01T14:17:56-03:00") }

        it "returns a Date object" do
          expect(subject.handle).to eq(DateTime.parse("2014-06-01T14:17:56-03:00"))
        end
      end

      context "when parameter is nil" do
        subject { Myfinance::AttributeHandler.new(nil) }

        it "returns parameter" do
          expect(subject.handle).to be_nil
        end
      end

      context "when parameter is blank" do
        subject { Myfinance::AttributeHandler.new("") }

        it "returns parameter" do
          expect(subject.handle).to eq("")
        end
      end

      context "when parameter is different from String" do
        subject { Myfinance::AttributeHandler.new([]) }

        it "returns parameter" do
          expect(subject.handle).to eq([])
        end
      end
    end
  end
end
