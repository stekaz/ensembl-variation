=head1 LICENSE

 Copyright (c) 1999-2011 The European Bioinformatics Institute and
 Genome Research Limited.  All rights reserved.

 This software is distributed under a modified Apache license.
 For license details, please see

   http://www.ensembl.org/info/about/code_licence.html

=head1 CONTACT

 Please email comments or questions to the public Ensembl
 developers list at <dev@ensembl.org>.

 Questions may also be sent to the Ensembl help desk at
 <helpdesk@ensembl.org>.

=cut

package Bio::EnsEMBL::Variation::MotifFeatureVariation;

use strict;
use warnings;

use Bio::EnsEMBL::Variation::MotifFeatureVariationAllele;
use Bio::EnsEMBL::Variation::Utils::VariationEffect qw(overlap);

use base qw(Bio::EnsEMBL::Variation::RegulationVariation);

sub new {
    my $class = shift;
    
    # call the superclass constructor
    my $self = $class->SUPER::new(@_) || return undef;
    
    # rebless the alleles from vfoas to mfvas
    map { bless $_, 'Bio::EnsEMBL::Variation::MotifFeatureVariationAllele' } @{ $self->alleles };
    
    return $self;
}

sub motif_feature_stable_id {
    my $self = shift;
    return $self->SUPER::feature_stable_id(@_);
}

sub motif_feature {
    my ($self, $mf) = @_;
    return $self->SUPER::feature($mf, 'MotifFeature');
}

1;
